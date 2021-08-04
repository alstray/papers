{ in(X,Y) ; in(Y,X) } 1 :- edge(X,Y).
:- not 1 { in(X,_) } 1, node(X).
:- not 1 { in(_,X) } 1, node(X).

#edge (X,Y): in(X,Y), X != s, Y != s.

:- not X < Y, in(s,X), in(Y,s).
