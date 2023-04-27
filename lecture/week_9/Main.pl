% Execute with: consult('Main.pl').
% main.

main :-
  welcome('John'),
  welcome('john'),
  welcome(john),
  bigger(10, 25),
  add(10, 25, Return),
  add(25, 10, Return).

welcome(john):-
  write('Welcome back john'), nl.

welcome(Name):-  
    write('Welcome '), write(Name), nl.

bigger(X,Y):- X>Y, write(X), write('is bigger than '), write(Y), nl.
bigger(X,Y):- X<Y, write(X), write(' is smaller than '), write(Y), nl.
bigger(X,Y):- X=Y, write(X), write(' is equal to '), write(Y), nl.


add(X,Y,Return):-
  Return is X+Y,
  write(Return), nl.  