%% timestep
t(0..t).

%% start
:- not closed_switch(SW,0), init_switch(SW).

%% goal
:- not closed_switch(SW,t), goal_switch(SW).

%% topological constraint
{ inForest(X,Y,TT); inForest(Y,X,TT) } 1 :- edge(X,Y), t(TT).

:- root(R), inForest(_,R,TT).
:- node(X), not root(X), t(TT), not 1 { inForest(_,X,TT) } 1.

:- node(X), t(TT), not 1 { reached(X,R,TT) } 1.

reached(R,R,TT) :- root(R), t(TT).
reached(X,R,TT) :- reached(Y,R,TT), inForest(Y,X,TT).

%% current constraint
connected(SW,S,T,TT) :- inForest(X,Y,TT), node(X,S), node(Y,T),
                     switch(SW,S,T).

closed_switch(SW,TT) :- connected(SW,_,_,TT).

entrance_section(S,X,TT) :- substation(S), section(S,X), t(TT).
entrance_section(S,X,TT) :- jct_node(X), section(S,X),
                         connected(_,_,S,TT).

downstream(S,T,TT) :- connected(_,S,T,TT).
downstream(S,T,TT) :- entrance_section(S,X,TT), section(T,X), S!=T.

suppliable(R,R,TT) :- substation(R), t(TT).
suppliable(T,R,TT) :- downstream(S,T,TT), suppliable(S,R,TT).

:- substation(R), t(TT),
   not #sum{ I,S:suppliable(S,R,TT), load(S,I) } max_current.

%% reconfiguration constraint
changed(SW,TT) :- not closed_switch(SW,TT), closed_switch(SW,TT-1), TT>0, t(TT).
changed(SW,TT) :- not closed_switch(SW,TT-1), closed_switch(SW,TT), TT>0, t(TT).
:- t(TT), not d #sum{ 1,SW:changed(SW,TT) } d, T>0.
