compare(5, 10).
compare(10, 5).
compare(5, 5).

compare(x, y) :- x > y, write(x), write(' is greater than '), write(y), nl.

compare(x, y) :-
  x < y,
  write(x),
  write(' is less than '),
  write(y),
  nl.

compare(x, y) :-
  x = y,
  write(x),
  write(' is equal to '),
  write(y),
  nl.
