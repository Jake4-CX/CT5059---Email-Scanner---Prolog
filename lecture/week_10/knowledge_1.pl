female(marge).
female(lisa).
female(maggie).
female(wilma).
female(pebbles).

male(homer).
male(bart).
male(fred).

parent(marge,bart).
parent(homer,bart).
parent(homer,lisa).
parent(marge,maggie).
parent(homer,maggie).
parent(wilma,pebbles).
parent(fred,pebbles).

farther(X,Y) :- parent(X,Y), male(X).
mother(X, Y) :- parent(X, Y), female(Y).