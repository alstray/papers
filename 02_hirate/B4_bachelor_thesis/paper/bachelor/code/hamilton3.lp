edge(Y,X)   :- edge(X,Y).
{ in(X,Y) } 1 :- edge(X,Y).

:- not 1 { in(X,_) } 1, node(X), s == t.
:- not 1 { in(_,X) } 1, node(X), s == t.
:- not 1 { in(X,_) } 1, node(X), s != t,
       	   	     		 X != s, X != t.
:- not 1 { in(_,X) } 1, node(X), s != t,
       	   	     		 X != s, X != t.
:- not 1 { in(s,_) } 1, s != t.
:- not   { in(_,s) } 0, s != t.
:- not 1 { in(_,t) } 1, s != t.
:- not   { in(t,_) } 0, s != t.

#edge (X,Y): in(X,Y), s != t.
#edge (X,Y): in(X,Y), X != s, Y != s, s == t.

% symmetry breaking
:- not X < Y, in(s,X), in(Y,s), s == t.