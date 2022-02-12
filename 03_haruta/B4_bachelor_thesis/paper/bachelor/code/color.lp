% グラフ
node(1).    node(2).    node(3).   node(4).    node(5).    node(6).
edge(1,2).  edge(1,3).  edge(1,4). edge(2,4).  edge(2,5).  edge(2,6).  
edge(3,4).  edge(3,5).  edge(3,6). edge(4,5).  edge(5,6).  

% 色
c(r).   c(b).   c(g).

% 制約
1 { color(X,C) : c(C) } 1 :- node(X).
:- edge(X,Y), color(X,C), color(Y,C).

#show color/2.