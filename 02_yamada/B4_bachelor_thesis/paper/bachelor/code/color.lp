% グラフ
node(1).    node(2).    node(3).   node(4).
edge(1,2).  edge(2,3).  edge(2,4). edge(3,4).

% 色
col(1..c).

% 制約
1 {color(X,C): col(C)} 1 :- node(X).
:- not { color(X,C); color(Y,C) } 1, edge(X, Y), col(C).

#show color/2.