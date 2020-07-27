vp_def("Drive_Type").
v_def("2WD","Drive_Type",125).
v_def("4WD","Drive_Type",200).

require_vp("Drive_Type").

require_v_v("STD","16_inch_Tire").
exclude_v_v("V4","10AT").

group(1..3).

