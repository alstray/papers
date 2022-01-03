%% test.yaml (dnet format)
%% 37 nodes, 25 sections, 3 substations 16 switches
dnet_node(1, ("section_-001"; "section_0302"; "section_0303")).
dnet_node(2, ("section_-002"; "section_0001"; "section_0002")).
dnet_node(3, ("section_-003"; "section_0008"; "section_0309")).
dnet_node(4, ("section_0302"; "switch_0010")).
dnet_node(5, ("section_0300"; "switch_0010")).
dnet_node(6, ("section_0298"; "section_0299"; "section_0300")).
dnet_node(7, ("section_0299"; "switch_0006")).
dnet_node(8, ("section_1057"; "switch_0006")).
dnet_node(9, ("section_1057"; "switch_0004")).
dnet_node(10, ("section_0298"; "switch_0009")).
dnet_node(11, ("section_0296"; "switch_0009")).
dnet_node(12, ("section_0296"; "switch_0008")).
dnet_node(13, ("section_0294"; "switch_0008")).
dnet_node(14, ("section_0294"; "switch_0007")).
dnet_node(15, ("section_0001"; "switch_0001")).
dnet_node(16, ("section_1063"; "switch_0001")).
dnet_node(17, ("section_1061"; "section_1062"; "section_1063")).
dnet_node(18, ("section_1061"; "switch_0002")).
dnet_node(19, ("section_1059"; "switch_0002")).
dnet_node(20, ("section_1059"; "switch_0004")).
dnet_node(21, ("section_1062"; "switch_0003")).
dnet_node(22, ("section_1066"; "switch_0003")).
dnet_node(23, ("section_1066"; "switch_0005")).
dnet_node(24, ("section_1068"; "switch_0005")).
dnet_node(25, ("section_1068"; "switch_0007")).
dnet_node(26, ("section_0002"; "switch_0011")).
dnet_node(27, ("section_0004"; "switch_0011")).
dnet_node(28, ("section_0004"; "switch_0012")).
dnet_node(29, ("section_0008"; "switch_0013")).
dnet_node(30, ("section_0006"; "switch_0013")).
dnet_node(31, ("section_0006"; "switch_0012")).
dnet_node(32, ("section_0309"; "switch_0016")).
dnet_node(33, ("section_0307"; "switch_0016")).
dnet_node(34, ("section_0307"; "switch_0015")).
dnet_node(35, ("section_0303"; "switch_0014")).
dnet_node(36, ("section_0305"; "switch_0014")).
dnet_node(37, ("section_0305"; "switch_0015")).
load("section_-001", 16).
load("section_-002", 41).
load("section_-003", 16).
load("section_0001", 31).
load("section_0002", 0).
load("section_0004", 20).
load("section_0006", 20).
load("section_0008", 0).
load("section_0294", 34).
load("section_0296", 11).
load("section_0298", 34).
load("section_0299", 0).
load("section_0300", 5).
load("section_0302", 40).
load("section_0303", 0).
load("section_0305", 35).
load("section_0307", 35).
load("section_0309", 0).
load("section_1057", 21).
load("section_1059", 20).
load("section_1061", 0).
load("section_1062", 24).
load("section_1063", 45).
load("section_1066", 45).
load("section_1068", 24).
substation("section_-002").
substation("section_-001").
substation("section_-003").
switch("switch_0001").
switch("switch_0002").
switch("switch_0003").
switch("switch_0004").
switch("switch_0005").
switch("switch_0006").
switch("switch_0007").
switch("switch_0008").
switch("switch_0009").
switch("switch_0010").
switch("switch_0011").
switch("switch_0012").
switch("switch_0013").
switch("switch_0014").
switch("switch_0015").
switch("switch_0016").
