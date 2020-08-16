%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% start
:- not inForest(X,Y,0), init_Forest(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program step(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% timestep
t(t).

%% solution candidates
{ inForest(X,Y,t) } :- edge(X,Y), t(t).

%% reachability
reached(R,R,t) :- root(R), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(Y,X,t), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(X,Y,t), t(t).

%% acyclicity constraint
:- root(R), t(t),
   not 1 #sum {  1,X:   reached(X,R,t);
		-1,X,Y: inForest(X,Y,t),
                        reached(X,R,t),
                        reached(Y,R,t)
               } 1.

%% rooted connectivity constraint
:- node(X), t(t), not 1 { reached(X,R,t) } 1.

%% transition constraint
dist(X,Y,t) :-
    inForest(X,Y,t), not inForest(X,Y,t-1), t(t), t>0.
dist(X,Y,t):-
    inForest(X,Y,t-1), not inForest(X,Y,t), t(t), t>0.
:- t(t), not #sum{ 1,X,Y:dist(X,Y,t) } d, t>0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program check(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% goal
:- not inForest(X,Y,t), goal_Forest(X,Y), query(t).
