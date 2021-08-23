#program base.
col(1..c).
color(X,C,0) :- start(X,C).

#program step(t).
1 { color(X,C,t): col(C) } 1 :- node(X).
:- not { color(X,C,t); color(Y,C,t) } 1, 
   edge(X,Y), col(C).

changed(X,t) :- color(X,C1,t), color(X,C2,t-1),
                C1 != C2, t >= 1.
:- not 1 { changed(X,t) } 1, t >= 1.

#program check(t).
:- not color(X,C,t), goal(X,C), query(t).
