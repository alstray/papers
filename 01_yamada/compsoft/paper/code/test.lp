dnet_node(1, ("s_a"; "s_1"; "s_15")).
dnet_node(2, ("s_b"; "s_8"; "s_16")).
dnet_node(3, ("s_c"; "s_18"; "s_17")).
dnet_node(4, ("s_1"; "sw_1")).
...

load("s_a", 16).
load("s_b", 41).
load("s_c", 16).
...

substation("s_a").
substation("s_b").
substation("s_c").

switch("sw_1").
switch("sw_2").
switch("sw_3").
...
