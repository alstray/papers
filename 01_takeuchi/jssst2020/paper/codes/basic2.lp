ub_vp(UB,VP) :-
    UB = #max { IWR,V : v_def(V,VP,IWR) },
    vp_def(VP).
lb_vp(LB,VP) :-
    LB = #min { IWR,V : v_def(V,VP,IWR) },
    vp_def(VP).

ub_iwr(S) :-
    S = #sum { UB,VP : ub_vp(UB,VP) }.
lb_iwr(S) :-
    S = #sum { LB,VP : lb_vp(LB,VP), require_vp(VP) }.

iwr(S,G) :-
    S = #sum { IWR,V : v(V,G), v_def(V,_,IWR) },
    LB <= S, S <= UB, lb_iwr(LB), ub_iwr(UB),
    group(G).
