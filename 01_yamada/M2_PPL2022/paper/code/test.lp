dnet_node(1, ("s_a"; "s_1"; "s_15")).
dnet_node(2, ("s_b"; "s_8"; "s_16")).
dnet_node(3, ("s_c"; "s_18"; "s_17")).
dnet_node(4, ("s_1"; "sw_1")).
.
.
.
dnet_node(37, ("s_21"; "sw_14")).

load("s_a", 16). load("s_b", 41). load("s_c", 16).
load("s_8", 31). load("s_16", 0). load("s_22", 20).
.
.
.
load("s_9", 45). load("s_12", 45). load("s_7", 24).

substation("s_a").
substation("s_b").
substation("s_c").

switch("sw_1"). switch("sw_2"). switch("sw_3").
switch("sw_4"). switch("sw_5"). switch("sw_6").
switch("sw_7"). switch("sw_8"). switch("sw_9").
switch("sw_10"). switch("sw_11"). switch("sw_12").
switch("sw_13"). switch("sw_14"). switch("sw_15").
switch("sw_16").
