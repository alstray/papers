%% solution candidates
{ inForest(X,Y) } :- edge(X,Y).

%% reachability
reached(R,R) :- root(R).
reached(X,R) :- reached(Y,R), inForest(Y,X).
reached(X,R) :- reached(Y,R), inForest(X,Y).

%% acyclicity constraint
:- root(R),
   not 1 #sum{ 1,X:reached(X,R) ;
              -1,X,Y:inForest(X,Y),reached(X,R),reached(Y,R)
	     } 1.

%% rooted connectivity constraint
:- node(X),  not reached(X,_).
:- reached(X,R1), reached(X,R2), R1 < R2.
