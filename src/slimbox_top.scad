/*
This file is the bottom of the fight stick.
*/

include <parts/top.scad>;
include <parts/screw_cutouts.scad>;
include <slimbox_dimensions.scad>;


module shell()
{
    screws(is_holder=true, screw_diameter=dim_screw_diameter, screw_height=dim_box_depth);
    top(box_width = dim_box_width, box_height = dim_box_height, box_depth = dim_box_depth, wall_thickness=dim_wall_thickness);
}

module cord_cutout(){
    color([1,0,0])
    rotate([270,0,0])
    translate([0,0,0])
    cylinder(dim_box_height, d1=dim_cord_cutout_diameter,d2=dim_cord_cutout_diameter, true);
}

difference(){
    shell();
    cord_cutout();
    
    translate([0,0,-dim_wall_thickness])
    screws(is_holder=false, screw_diameter=dim_screw_diameter, screw_height=dim_box_depth);
}