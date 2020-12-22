%% spanning rooted forest

%% choose edge
{ inForest(X,Y); inForest(Y,X) } 1 :- edge(X,Y).

%% tree constraint
:- root(R), inForest(_,R).
:- node(X), not root(X), not 1 { inForest(_,X) } 1.

%% connectivity constraint
:- node(X), not 1 { reached(X,R) } 1.

%% generate reached
reached(R,R) :- root(R).
reached(X,R) :- reached(Y,R), inForest(Y,X).
% reached(X,R) :- reached(Y,R), inForest(X,Y).

