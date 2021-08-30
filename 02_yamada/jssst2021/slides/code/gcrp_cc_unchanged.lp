col(1..c).    t(0..length).

:- not color(X,C,0), start(X,C).

1 { color(X,C,T): col(C) } 1 :- node(X), t(T).
:- not { color(X,C,T); color(Y,C,T) } 1,
   edge(X, Y), col(C), t(T).

unchanged(X,T) :- color(X,C,T), color(X,C,T-1), 
                  T >= 1.
:- not N-1 { unchanged(X,T) } N-1 , 
   n(N), t(T), T >= 1.

:- not color(X,C,length), goal(X,C).
