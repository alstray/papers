#const core_max = l.

#program base.

col(1..c).
:- not color(X, C, 0), start(X, C).

#program step(t).

1 { color(X, C, t): col(C) } 1 :- node(X).
:- not { color(X, C, t); color(Y, C, t) } 1, edge(X, Y), col(C).

unchanged(X, t) :- color(X, C, t), color(X, C, t-1), t >= 1.
:- not N-1 { unchanged(X, t) } N-1 , n(N), t >= 1.

#program check(t).

:- not color(X, C, t), goal(X, C), query(t).
