% 販売台数を最大化
#maximize { SV@2,G : sv(SV,G) }.

% オプション数を最小化
used_v(V) :- v(V,G).
#minimize {1@1,V : used_v(V) }.

