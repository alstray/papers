% 予想販売台数の最大化(max_sv)
#preference (max_sv, more(weight)) { SV,G :: sv(SV,G) }.

% オプション数の最小化(min_op)
used_v(V) :- v(V,G).
#preference (min_op, less(weight)) { 1,V :: used_v(V) }.

% max_sv と min_op のパレート(all)
#preference (all, pareto) { **max_sv; **min_op}.

% all を最適化
#optimize(all).
