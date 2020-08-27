{ inForest(X,Y) } :- edge(X,Y).

reached(R,R) :- root(R).
reached(X,R) :- reached(Y,R), inForest(Y,X).
reached(X,R) :- reached(Y,R), inForest(X,Y).

:- root(R),
   not 1 #sum{ 1,X:reached(X,R) ;
	  -1,X,Y:inForest(X,Y),reached(X,R),reached(Y,R)
	  } 1.

:- node(X), not 1 { reached(X,R) } 1.
