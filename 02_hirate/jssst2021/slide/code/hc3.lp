(1) { in(X,Y) ; in(Y,X) } 1 :- edge(X,Y).

(2) :- not 1 { in(X,_) } 1, node(X).
(3) :- not 1 { in(_,X) } 1, node(X).

(4) #edge (X,Y): in(X,Y), X != s, Y != s.

(5) :- not X < Y, in(s,X), in(Y,s).
