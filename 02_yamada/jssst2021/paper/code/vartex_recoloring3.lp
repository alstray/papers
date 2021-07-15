col(1..c).
t(0..t).

:- not color(X, C, 0), start(X, C).
:- not color(X, C, t), goal(X, C).


% 各遷移段階における状態の制約
1 { color(X, C, T):col(C) } 1 :- node(X), t(T).
:- not {color(X, C, T); color(Y, C, T)} 1, edge(X, Y), col(C), t(T).


% 遷移制約
unchanged(X, T) :- color(X, C, T), color(X, C, T-1), T >= 1.
:- not N-1 { unchanged(X, T) } N-1 , t(T), T >= 1, n(N).
