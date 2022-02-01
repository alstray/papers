#const v=1.

c(1..k).
1 { color(X,C) : c(C) } 1 :- node(X).
:- color(X,C), color(Y,C), edge(X,Y).

#maximize{ 1,X : color(X,v) }.


