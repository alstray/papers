{ in(X,Y) } :- edge(X,Y).

:- not 2 { in(X,_) ; in(_,X) } 2, node(X), 
       	   	     	       	  	   s == t.
:- not 2 { in(X,_) ; in(_,X) } 2, node(X), 
       	   	     	     s != t, X != s, X != t.
:- not 1 { in(s,_) ; in(_,s) } 1, s != t.
:- not 1 { in(t,_) ; in(_,t) } 1, s != t.

reached(s).
reached(Y) :- reached(X), in(X,Y).
reached(Y) :- reached(X), in(Y,X).
:- not reached(X), node(X).