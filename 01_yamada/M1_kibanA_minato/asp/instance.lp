%% test.yaml
%% ノード:15, 辺:16, 根ノード:3
node(1..15).

root(1). root(10). root(13).

edge(1,2). edge(3,2). edge(2,4). edge(5,3). edge(4,6).
edge(7,5). edge(8,6). edge(8,9). edge(9,7). edge(10,7).
edge(1,11). edge(11,12). edge(13,12). edge(10,14). edge(14,15).
edge(13, 15).

%% スタート状態
init_Forest(3,2).
init_Forest(2,4).
init_Forest(4,6).
init_Forest(7,5).
init_Forest(8,6).
init_Forest(8,9).
init_Forest(9,7).
init_Forest(10,7).
init_Forest(11,12).
init_Forest(13,12).
init_Forest(14,15).
init_Forest(13,15).

%% ゴール状態
goal_Forest(1,2).
goal_Forest(3,2).
goal_Forest(2,4).
goal_Forest(5,3).
goal_Forest(4,6).
goal_Forest(8,9).
goal_Forest(9,7).
goal_Forest(10,7).
goal_Forest(1,11).
goal_Forest(13,12).
goal_Forest(10,14).
goal_Forest(14,15).

