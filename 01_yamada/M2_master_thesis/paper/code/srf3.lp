%% solution candidates
{ inForest(X,Y); inForest(Y,X) } 1 :- edge(X,Y).

%% reachability
reached(R,R) :- root(R).
reached(X,R) :- reached(Y,R), inForest(Y,X).

%% acyclicity constraint
:- root(R), inForest(_,R).
:- node(X), not root(X), not 1 { inForest(_,X) } 1.

%% rooted connectivity constraint
:- node(X), not 1 { reached(X,R) } 1.

