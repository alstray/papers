(1) { in(X,Y) ; in(Y,X) } 1 :- edge(X,Y).

(2) :- not 1 { in(X,_) } 1, node(X).
(3) :- not 1 { in(_,X) } 1, node(X).

(4) reached(s).
(5) reached(Y) :- reached(X), in(X,Y).
(6) :- not reached(X), node(X).

(7) :- not X < Y, in(s,X), in(Y,s).
