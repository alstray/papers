%% node
node(1..6).

%% root
root(1). root(3).

%% edge
edge(1,2). edge(1,4). edge(2,3).
edge(2,5). edge(3,6). edge(4,5). edge(5,6).

% init
init_Forest(1,2). init_Forest(1,4).
init_Forest(3,6). init_Forest(5,6).

% goal
goal_Forest(2,3). goal_Forest(2,5).
goal_Forest(4,5). goal_Forest(5,6).
