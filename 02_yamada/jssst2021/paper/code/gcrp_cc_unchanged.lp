col(1..c).
t(0..l).

% start status
:- not color(X, C, 0), start(X, C).

% constraints
1 { color(X, C, T): col(C) } 1 :- node(X), t(T).
:- not { color(X, C, T); color(Y, C, T) } 1, edge(X, Y), col(C), t(T).

% transition
unchanged(X, T) :- color(X, C, T), color(X, C, T-1), T >= 1.
:- not N-1 { unchanged(X, T) } N-1 , n(N), t(T), T >= 1.

% goal status
:- not color(X, C, l), goal(X, C).
