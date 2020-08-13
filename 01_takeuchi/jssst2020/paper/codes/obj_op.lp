% 予想販売台数の最大化
#maximize { SV@2,G : sv(SV,G) }.

% オプション数の最小化
used_v(V) :- v(V,G).
#minimize { 1@1,V : used_v(V) }.

