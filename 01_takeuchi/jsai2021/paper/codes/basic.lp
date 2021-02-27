{ vp(VP,G) } :- vp_def(VP), group(G).
:- not vp(VP,G), require_vp(VP), group(G).

% 範囲制約
1 { v(V,G) : v_def(V,VP,_) } 1 :- vp(VP,G).
   
% 燃費制約
ub_vp(UB,VP) :- UB = #max { IWR,V : v_def(V,VP,IWR) }, vp_def(VP).
lb_vp(LB,VP) :- LB = #min { IWR,V : v_def(V,VP,IWR) }, vp_def(VP).
ub_iwr(S) :- S = #sum { UB,VP : ub_vp(UB,VP) }.
lb_iwr(S) :- S = #sum { LB,VP : lb_vp(LB,VP), require_vp(VP) }.
iwr(S,G) :- S = #sum { IWR,V : v(V,G), v_def(V,_,IWR) },
	    LB <= S, S <= UB, lb_iwr(LB), ub_iwr(UB), group(G).
fe(FE,G) :- iwr(S,G), fe_map(S,FE).
sv(SV,G) :- iwr(S,G), sv_map(S,SV).
:- not 0 #sum { (FE-t)*SV,FE,SV,G : fe(FE,G), sv(SV,G) }.

% 依存制約(要求)
:- require_v_v(V1,V2), v(V1,G), not v(V2,G).
:- require_v_vp(V,VP), v(V,G), not vp(VP,G).
:- require_vp_v(VP,V), vp(VP,G), not v(V,G).
:- require_vp_vp(VP1,VP2), vp(VP1,G), not vp(VP2,G).

% 依存制約(排他)
:- exclude_v_v(V1,V2), v(V1,G), v(V2,G).
:- exclude_v_vp(V,VP), v(V,G), vp(VP,G).
:- exclude_vp_v(VP,V), vp(VP,G), v(V,G).
:- exclude_vp_vp(VP1,VP2), vp(VP1,G), vp(VP2,G).

% 予想販売台数の最大化
#preference (max_sv, more(weight)) { SV,G :: sv(SV,G) }.

% 装備オプション数の最小化
used_v(V) :- v(V,G).
#preference (min_op, less(weight)) { 1,V :: used_v(V) }.

% max_sv と min_op のパレート(all)
#preference (all, pareto) { **max_sv; **min_op}.

% all を最適化
#optimize(all).
