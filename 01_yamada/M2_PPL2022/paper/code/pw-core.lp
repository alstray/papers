%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- not closed_switch(SW,0), init_switch(SW).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program step(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% topological constraint
{ inForest(X,Y,t); inForest(Y,X,t) } 1 :- edge(X,Y).

:- root(R), inForest(_,R,t).
:- node(X), not root(X), not 1 { inForest(_,X,t) } 1.

:- node(X), not 1 { reached(X,R,t) } 1.

reached(R,R,t) :- root(R).
reached(X,R,t) :- reached(Y,R,t), inForest(Y,X,t).

%%% current constraint
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

:- substation(R),
   not #sum{ I,S:suppliable(S,R,t), load(S,I) } max_current.

%%% reconfiguration constraint
changed(SW,t) :- closed_switch(SW,t), not closed_switch(SW,t-1), t>0.
changed(SW,t) :- closed_switch(SW,t-1), not closed_switch(SW,t), t>0.
:- not d #sum{ 1,SW:changed(SW,t) } d, t>0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program check(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- not closed_switch(SW,t), goal_switch(SW), query(t).
