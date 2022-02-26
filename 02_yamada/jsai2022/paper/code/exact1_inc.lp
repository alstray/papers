#program base.

:- not in(X,0), start(X).

#program step(t).

K { in(X,t): node(X) } K :- k(K).
:- in(X,t), in(Y,t), edge(X,Y).

moved_from(X,t) :- in(X,t-1), not in(X,t), t > 0.
:- not 1 { moved_from(X,t) } 1, t > 0.

#program check(t).

:- not in(X,t), goal(X), query(t).
