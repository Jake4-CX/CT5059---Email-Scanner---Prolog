:- use_module(library(pio)).
:- use_module(library(dcg/basics)).

:- initialization(main).

% illegal phrases
illegal_phrase(threat).
illegal_phrase(vulnerabilities).
illegal_phrase(attack).
illegal_phrase(loopholes).
illegal_phrase(whitelist).
illegal_phrase(blacklist).
illegal_phrase(hash).
illegal_phrase(encryption).


% check if a character is punctuation
is_punctuation(Char) :-
  memberchk(Char, ['.', ',', ';', ':', '!', '?', '-', '_', '(', ')', '[', ']', '{', '}', '"', '''']).

% Read file and normalize text
read_file(File, Words) :-
  phrase_from_file(string(Text), File),
  atom_string(A, Text),
  downcase_atom(A, D), % nomralize text to lowercase
  atomic_list_concat(Lines, '\n', D), % split text into lines
  maplist(split_line, Lines, WordsList),
  flatten(WordsList, Words).

% Split line into words and remove punctuation
split_line(Line, Words) :-
  atom_chars(Line, Chars),
  exclude(is_punctuation, Chars, CharsWithoutPunctuation), % remove punctuation
  atom_chars(LineWithoutPunctuation, CharsWithoutPunctuation),
  atomic_list_concat(Words, ' ', LineWithoutPunctuation). % split line into words

% Count frequency of each word
word_frequency(Words, Frequencies) :-
	list_to_set(Words, Set),
	findall(F-W, (member(W, Set), bagof(_, member(W, Words), Ws), length(Ws, F)), Frequencies). % https://www.swi-prolog.org/pldoc/man?predicate=findall/3

% Print the N most frequent words
print_frequent_words(Frequencies, N) :-
	sort(1, @>=, Frequencies, SortedFrequencies), % order frequency in descending order
	get_n_elements(N, SortedFrequencies, MostFrequent),
	maplist(print_word_frequency, MostFrequent),
	nl.

% get the first N elements of a list
get_n_elements(N, List, Front) :-
	length(List, L),
	M is min(N, L), % Prevents error if the Nth term is greater than the amount of unique words
	length(Front, M),
	append(Front, _, List).

print_word_frequency(F-W) :-
	% Goal "word (frequency),"...
	write(W), write(' ('), write(F), write('), ').

% Since we now have the frequency of each word, we can count the number of illegal phrases
count_illegal_phrases(Frequencies, IllegalPhraseCounter) :-
	findall(F, (member(F-W, Frequencies), illegal_phrase(W)), Counts),
  sum_list(Counts, IllegalPhraseCounter). % add up all the counts

main :-
  read_file('emails_to_check/email6.txt', Words),
  % write("Words: "),
  % writeln(Words), % debugging

  % List N most frequent words (10)
  write("Most frequent words: "),
  word_frequency(Words, Frequencies),
	% writeln(Frequencies),
  print_frequent_words(Frequencies, 10),


  write("Illegal phrases: "),
  count_illegal_phrases(Frequencies, IllegalPhraseCounter),
  writeln(IllegalPhraseCounter),
	write("Email is "),
  (IllegalPhraseCounter >= 5 -> write("Suspicious"); write("Safe")),
  halt. % exit the program