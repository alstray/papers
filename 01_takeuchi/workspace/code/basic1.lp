% 企業平均燃費規制の値
#const t = 90. 

{ vp(VP,G) } :- vp_def(VP), group(G).

% 個数制約
1 { v(V,G) : v_def(V,VP,_) } 1 :- vp(VP,G).
   
% 燃費制約(CAFE)
iwr(S,G) :- S = #sum { IWR,V : v(V,G), v_def(V,_,IWR) }, group(G).
fe(FE,G) :- iwr(S,G), fe_map(S,FE).
sv(SV,G) :- iwr(S,G), S1 = ((S+2)/5)*5, sv_map(S1,SV).
:- not 0 <= #sum { (FE-t)*SV,FE,SV,G : fe(FE,G), sv(SV,G) }.

% 要求制約
:- not vp(VP,G), require_vp(VP), group(G).
:- require_v_v(V,W), v(V,G), not v(W,G).
:- require_vp_v(VP,V), vp(VP,G), not v(V,G).
:- require_v_vp(V,VP), v(V,G), not vp(VP,G).

% 販売台数を最大化
#maximize { SV,G : sv(SV,G) }.
