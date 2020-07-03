% 企業平均燃費規制の値
#const t = 90. 

{ vp(VP,G) } :- vp_def(VP), group(G).

% 個数制約
1 { v(V,G) : v_def(V,VP,_) } 1 :- vp(VP,G).

% IWR値の和の上下限の計算(前処理)
ub_vp(UB,VP) :- UB = #max { IWR,V : v_def(V,VP,IWR) }, vp_def(VP).
ub_iwr(S) :- S = #sum { UB,VP : ub_vp(UB,VP) }.
lb_vp(LB,VP) :- LB = #min { IWR,V : v_def(V,VP,IWR) }, vp_def(VP).
lb_iwr(S) :- S = #sum { LB,VP : lb_vp(LB,VP), require_vp(VP) }.

% 燃費制約(CAFE)
iwr(S,G) :- S = #sum { IWR,V : v(V,G), v_def(V,_,IWR) },
	    LB <= S, S <= UB, lb_iwr(LB), ub_iwr(UB),  group(G).
fe(FE,G) :- iwr(S,G), fe_map(S,FE).
sv(SV,G) :- iwr(S,G), S1 = ((S+2)/5)*5, sv_map(S1,SV).
:- not 0 <= #sum { (FE-t)*SV,FE,SV,G : fe(FE,G), sv(SV,G) }.

% 要求仕様制約
:- not vp(VP,G), require_vp(VP), group(G).
:- require_v_v(V,W), v(V,G), not v(W,G).
:- require_vp_v(VP,V), vp(VP,G), not v(V,G).
:- require_v_vp(V,VP), v(V,G), not vp(VP,G).

% 排他仕様制約
:- exclude_v_v(V,W), v(V,G), v(W,G).
:- exclude_v_vp(V,VP), vp(VP,G), v(V,G).
:- exclude_vp_vp(X,Y), vp(X,G), cp(Y,G).

% 販売台数を最大化
#maximize { SV,G : sv(SV,G) }.

