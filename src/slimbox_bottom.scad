/*
This file is the bottom of the fight stick.
*/

include <parts/base.scad>;
include <parts/screw_cutouts.scad>;
include <slimbox_dimensions.scad>;

difference(){
    linear_extrude(height = dim_base_thickness)
    base(box_width = dim_box_width, box_height = dim_box_height);

    screws(is_holder=false, screw_diameter=dim_screw_diameter);
}