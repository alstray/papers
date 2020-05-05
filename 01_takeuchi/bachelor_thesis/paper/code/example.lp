% VariationPoint & Variant
vp_def("Drive_Type").
v_def("2WD","Drive_Type",125).
v_def("4WD","Drive_Type",200).

vp_def("Engine").
v_def("V4","Engine",120).
v_def("V6","Engine",200).

vp_def("Grade").
v_def("STD","Grade", 350).
v_def("DX","Grade", 350).
v_def("LX","Grade", 350).

vp_def("Sun_Roof").
v_def("Nomal","Sun_Roof",35).
v_def("Panorama","Sun_Roof",70).

vp_def("Tire").
v_def("15_inch_Tire","Tire",90).
v_def("16_inch_Tire","Tire",110).
v_def("17_inch_Tire","Tire",130).
v_def("18_inch_Tire","Tire",150).

vp_def("Transmission").
v_def("AT_typeA","Transmission",115).
v_def("AT_typeB","Transmission",125).
v_def("HEV","Transmission",95).
v_def("CVT","Transmission",80).
v_def("MT_typeA","Transmission",48).
v_def("MT_typeB","Transmission",55).

% Require
require_vp("Drive_Type").
require_vp("Engine").
require_vp("Grade").
require_vp("Tire").
require_vp("Transmission").

require_v_v("STD","16_inch_Tire").
require_v_v("LX","18_inch_Tire").
require_v_v("DX","17_inch_Tire").
require_v_v("LX","AT_typeA").

% Variability
group(1).
group(2).
group(3).
:-not v("STD", 1).
:-not v("DX", 2).
:-not v("LX", 3).
