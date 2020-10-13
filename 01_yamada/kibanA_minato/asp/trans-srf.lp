%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% スタート状態
:- not inForest(X,Y,0), init_Forest(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program step(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ステップ数
t(t).

%% 解の候補
{ inForest(X,Y,t) } :- edge(X,Y), t(t).

%% 到達可能性
reached(R,R,t) :- root(R), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(Y,X,t), t(t).
reached(X,R,t) :- reached(Y,R,t), inForest(X,Y,t), t(t).

%% 非閉路制約
:- root(R), t(t), not 1 #sum {  1,X: reached(X,R,t);
				  	  		 -1,X,Y: inForest(X,Y,t),
                        	 		 reached(X,R,t),
									 reached(Y,R,t)
               				 } 1.

%% 根付き連結制約
:- node(X), t(t), not 1 { reached(X,R,t) } 1.

%% 遷移制約
dist(X,Y,t) :- inForest(X,Y,t), not inForest(X,Y,t-1), t(t), t>0.
dist(X,Y,t) :- inForest(X,Y,t-1), not inForest(X,Y,t), t(t), t>0.
:- t(t), not #sum{ 1,X,Y:dist(X,Y,t) } 2, t>0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program check(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ゴール状態
:- not inForest(X,Y,t), goal_Forest(X,Y), query(t).
