%% timestep
t(0..t).

%% start
:- not inForest(X,Y,0), init_Forest(X,Y).

%% goal
:- not inForest(X,Y,t), goal_Forest(X,Y).

%% solution candidates
{ inForest(X,Y,T) } :- edge(X,Y), t(T).

%% reachability
reached(R,R,T) :- root(R), t(T).
reached(X,R,T) :- reached(Y,R,T), inForest(Y,X,T), t(T).
reached(X,R,T) :- reached(Y,R,T), inForest(X,Y,T), t(T).

%% acyclicity constraint
:- root(R), t(T),
   not 1 #sum {  1,X:   reached(X,R,T);
                -1,X,Y: inForest(X,Y,T),
		        reached(X,R,T),
                        reached(Y,R,T)
               } 1.

%% rooted connectivity constraint
:- node(X), t(T), not 1 { reached(X,R,T) } 1.

%% transition constraint
dist(X,Y,T) :-
    inForest(X,Y,T), not inForest(X,Y,T-1), t(T), T>0.
dist(X,Y,T) :-
    inForest(X,Y,T-1), not inForest(X,Y,T), t(T), T>0.
:- t(T), not #sum{ 1,X,Y:dist(X,Y,T) } d.

