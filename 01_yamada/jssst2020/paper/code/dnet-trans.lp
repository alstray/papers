#const istop = "SAT".
#const imin = 0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% init
:- not inForest(X,Y,0), init_Forest(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program step(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t(t).

%% choose switch
{ inForest(X,Y,t) } :- edge(X,Y), t(t).

%% tree constraint
:- root(R), t(t), not 1 #sum{ 1,X:reached(X,R,t) ; -1,X,Y:inForest(X,Y,t),reached(X,R,t),reached(Y,R,t)} 1.

%% connectivity constraint
:- node(X), t(t), not 1 { reached(X,R,t) } 1.

%% generate reached
reached(R,R,t) :- root(R), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(Y,X,t), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(X,Y,t), t(t).

%% transition constraint
dist(X,Y,t) :- inForest(X,Y,t), not inForest(X,Y,t-1), t(t), t>0.
dist(X,Y,t) :- inForest(X,Y,t-1), not inForest(X,Y,t), t(t), t>0.
:- t(t), not #sum{ 1,X,Y:dist(X,Y,t) } d, t>0.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program check(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% goal
:- not inForest(X,Y,t), goal_Forest(X,Y), query(t).
