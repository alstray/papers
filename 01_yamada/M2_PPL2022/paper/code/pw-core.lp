%%% require: recongo/core.lp
#const core_stop = "SAT".
#const core_min = 0.

#const d = 2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% init
:- not closed_switch(SW,0), init_switch(SW).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Pre-processing
swt_node(X) :- dnet_node(X,S), switch(S).
jct_node(X) :- dnet_node(X,_), not swt_node(X).

section(S,X) :- dnet_node(X,S), not switch(S).
section(S)   :- section(S,_).

jct_section(S) :- section(S,X), jct_node(X).
swt_section(S) :- section(S,X), swt_node(X).

switch(SW,S,T) :- section(S,X), section(T,Y), S!=T,
	              dnet_node(X,SW), dnet_node(Y,SW), switch(SW).

%% spanning rooted tree
node(X,  S) :- jct_section(S), dnet_node(X,S), jct_node(X).
node(Min,S) :- swt_section(S), not jct_section(S),
               Min = #min { X : dnet_node(X,S) }.

root(X) :- node(X,S), substation(S).
node(X) :- node(X,_).

edge(X,Y) :- node(X,S), node(Y,T), X<Y, switch(SW,S,T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program step(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% spanning rooted forest

%% choose edge
{ inForest(X,Y,t); inForest(Y,X,t) } 1 :- edge(X,Y).

%% tree constraint
:- root(R), inForest(_,R,t).
:- node(X), not root(X), not 1 { inForest(_,X,t) } 1.

%% connectivity constraint
:- node(X), not 1 { reached(X,R,t) } 1.

%% generate reached
reached(R,R,t) :- root(R).
reached(X,R,t) :- reached(Y,R,t), inForest(Y,X,t).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% electrical constraints
connected(SW,S,T,t) :- inForest(X,Y,t), node(X,S), node(Y,T),
                       switch(SW,S,T).

closed_switch(SW,t) :- connected(SW,_,_,t).

entrance_section(S,X,t) :- substation(S), section(S,X).
entrance_section(S,X,t) :- jct_node(X), section(S,X),
                           connected(_,_,S,t).

downstream(S,T,t) :- connected(_,S,T,t).
downstream(S,T,t) :- entrance_section(S,X,t), section(T,X), S!=T.

suppliable(R,R,t) :- substation(R).
suppliable(T,R,t) :- downstream(S,T,t), suppliable(S,R,t).

%% current constraint
:- substation(R),
   not #sum{ I,S:suppliable(S,R,t), load(S,I) } max_current.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% reconfiguration constraint
changed(SW,t) :- closed_switch(SW,t), not closed_switch(SW,t-1), t>0.
changed(SW,t) :- closed_switch(SW,t-1), not closed_switch(SW,t), t>0.
:- not d #sum{ 1,SW:changed(SW,t) } d, t>0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program check(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% goal
:- not closed_switch(SW,t), goal_switch(SW), query(t).
