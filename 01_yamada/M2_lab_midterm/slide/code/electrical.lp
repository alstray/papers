%%% electrical constraints

connected(SW,S,T) :- inForest(X,Y), node(X,S), node(Y,T),
                     switch(SW,S,T).

closed_switch(SW) :- connected(SW,_,_).

entrance_section(S,X) :- substation(S), section(S,X).
entrance_section(S,X) :- jct_node(X), section(S,X),
                         connected(_,_,S).

downstream(S,T) :- connected(_,S,T).
downstream(S,T) :- entrance_section(S,X), section(T,X), S!=T.

suppliable(R,R) :- substation(R).
suppliable(T,R) :- downstream(S,T), suppliable(S,R).

:- substation(R),
   not #sum{ I,S:suppliable(S,R), load(S,I) } max_current.

