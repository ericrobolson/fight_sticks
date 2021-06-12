/*
This file is the bottom of the fight stick.
*/

include <slimbox_dimensions.scad>;
include <parts/base.scad>;

linear_extrude(height = dim_base_thickness)
base(box_width = dim_box_width, box_height = dim_box_height);