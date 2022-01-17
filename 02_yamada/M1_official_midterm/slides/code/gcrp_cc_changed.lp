col(1..c).    t(0..length).

:- not color(X,C,0), start(X,C).

1 { color(X,C,T): col(C) } 1 :- node(X), t(T).
:- not { color(X,C,T); color(Y,C,T) } 1,
   edge(X,Y), col(C), t(T).

changed(X,T) :- color(X,C1,T), color(X,C2,T-1),	C1!=C2, T>=1.
:- not 1  { changed(X,T) } 1, t(T), T >= 1.

:- not color(X,C,length), goal(X,C).
