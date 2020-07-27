% CAFE基準値
#const t = 90. 

{ vp(VP,G) } :- vp_def(VP), group(G).
:- not vp(VP,G), require_vp(VP), group(G).
1 { v(V,G) : v_def(V,VP,_) } 1 :- vp(VP,G).
   
% 燃費制約(CAFE)
iwr(S,G) :- S = #sum { IWR,V : v(V,G), v_def(V,_,IWR) }, group(G).
fe(FE,G) :- iwr(S,G), fe_map(S,FE).
sv(SV,G) :- iwr(S,G), S1 = ((S+2)/5)*5, sv_map(S1,SV).
:- not 0 <= #sum { (FE-t)*SV,FE,SV,G : fe(FE,G), sv(SV,G) }.

% 要求・排他制約
:- require_v_v(V,W), v(V,G), not v(W,G).
:- require_vp_v(VP,V), vp(VP,G), not v(V,G).
:- require_v_vp(V,VP), v(V,G), not vp(VP,G).
:- exclude_v_v(V,W), v(V,G), v(W,G).
:- exclude_vp_v(VP,V), vp(VP,G), v(V,G).

% 目的関数
#maximize { SV,G : sv(SV,G) }.
