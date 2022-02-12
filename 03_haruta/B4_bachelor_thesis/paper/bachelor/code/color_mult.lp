c(1..k).
1 { color(X,C) : c(C) } :- node(X).
:- color(X,C), color(Y,C), edge(X,Y).

mult(X) :- 2 { color(X,C) }, node(X).

#maximize { 1,X : mult(X) }.
