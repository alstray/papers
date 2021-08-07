col(1..c).

1 { color(X,C): col(C) } 1 :- node(X).
:- not { color(X,C); color(Y,C) } 1, edge(X,Y), col(C).

#show color/2.