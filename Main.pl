:- initialization(main).

% Read content from the file
read_file(Stream, []) :-
    at_end_of_stream(Stream).

read_file(Stream, [Char|Chars]) :-
    \+ at_end_of_stream(Stream),
    get_char(Stream, Char),
    read_file(Stream, Chars).

% Display content
display_content([]) :-
    nl.

display_content([Char|Chars]) :-
    put_char(Char),
    display_content(Chars).

% Main predicate
main :-
    open('email_malicious.txt', read, Stream),
    read_file(Stream, Content),
    close(Stream),
    write('Content of the file:'), nl,
    % Turn list to string
    
    % string_lower(Content, Content)
    display_content(Content),
    halt.