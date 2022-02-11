swt_node(X) :- dnet_node(X,S), switch(S).
jct_node(X) :- dnet_node(X,_), not swt_node(X).

section(S,X) :- dnet_node(X,S), not switch(S).
section(S)   :- section(S,_).

swt_section(S) :- section(S,X), swt_node(X).
jct_section(S) :- section(S,X), jct_node(X).

switch(SW,S,T) :- section(S,X), section(T,Y), S!=T, dnet_node(X,SW), dnet_node(Y,SW), switch(SW).

%% spanning rooted tree
node(X,  S) :- jct_section(S), dnet_node(X,S), jct_node(X).
node(Min,S) :- swt_section(S), not jct_section(S),
               Min = #min { X : dnet_node(X,S) }.

root(X) :- node(X,S), substation(S).
node(X) :- node(X,_).
edge(X,Y) :- node(X,S), node(Y,T), X<Y, switch(SW,S,T).
