(1) { in(X,Y) } :- edge(X,Y).

(2) :- not 2 { in(X,_) ; in(_,X) } 2, node(X).

(3) reached(s).
(4) reached(Y) :- reached(X), in(X,Y).
(5) reached(Y) :- reached(X), in(Y,X).
(6) :- not reached(X), node(X).

