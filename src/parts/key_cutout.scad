
$fn = 2000;

/// Creates a switch hole cutout.
module switch_hole(position, height = 20){
  // https://github.com/technomancy/atreus/blob/master/case/openscad/atreus_case.scad
  /* Cherry MX switch hole with the center at `position`. Sizes come
      from the ErgoDox design. */  

  hole_size = 13.97;
  notch_width = 3.5001;
  notch_offset = 4.2545;
  notch_depth = 0.8128;

  // Convert from 2d to 

  linear_extrude(height = height, center = true){
    square([hole_size, hole_size], center = true);

    translate([0, notch_offset]){
      square([hole_size + 2 * notch_depth, notch_width], center = true);
    }
    translate([0, -notch_offset]){
      square([hole_size + 2 * notch_depth, notch_width], center = true);
    }
  }
};

module switch_cutout(position){
  switch_cutout_width = 20;
  switch_cutout_height = 5;

  w = switch_cutout_width;
  h = switch_cutout_height;
  translate(position){
    difference(){
      cube([w, w, h], true);
      switch_hole([0], height = 200);
    }
  }
}

module switch_with_border(){
  switch_cutout([0, 0, 2.5]);
  difference(){
    translate([0, 0, 5]){
      cube([30, 30, 10], true);
    }
    translate([0, 0, 5]){
      cube([20, 20, 10], true);
    }
  }
}

switch_hole([0, 0, 0]);