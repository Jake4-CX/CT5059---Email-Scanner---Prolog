likes(mary, food).
likes(mary, wine).

likes(john, X):-
  likes(mary, X).

% Then likes(john, 'What').