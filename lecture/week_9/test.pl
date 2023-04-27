man(paul).
man(david).
man(peter).
woman(louise).
woman(helen).
women(mandy).
wifeof(oaul, louise).
wifeof(peter, helen).
sonof(paul, peter).
daughterof(peter, mandy).

parentof(Person1, Person2) :-
  sonof(Person1, Person2).
parentof(Person1, Person2) :-
  daughterof(Person1, Person2).

grandparent(OldPerson, YoungerPerson) :-
  parentof(OldPerson, Another),
  parentof(Person, YoungerPerson).