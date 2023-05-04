prerequsite(cs231, cs151).
prerequsite(cs232, cs231).
prerequsite(cs333, cs231).
prerequsite(cs421, cs333).

all_prerequsite(X, Y) :- prerequsite(X, Y).
all_prerequsite(X, Y) :- prerequsite(X, Z), all_prerequsite(Z, Y).