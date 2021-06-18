/*
This file is the bottom of the fight stick.
*/

include <parts/base.scad>;
include <parts/screw_cutouts.scad>;
include <slimbox_dimensions.scad>;

difference() {
    height = 2;
screws(is_holder=true,screw_height=height, screw_diameter=dim_screw_diameter);
screws(is_holder=false,screw_height=height, screw_diameter=dim_screw_diameter);
}