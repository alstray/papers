%%node
node(1..6).

%%edge
edge(1,2).	edge(1,3).	edge(2,4).
edge(3,4).	edge(3,5).	edge(4,6).
edge(5,6).

%%cost
cost(1,2,3).	cost(1,3,2).	cost(2,4,3).
cost(3,4,2).	cost(3,5,1).	cost(4,6,1).
cost(5,6,2).