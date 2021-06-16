/*
This is a generic top for the fight stick.
*/

include <base.scad>;


/// Creates a generic top for the hitbox
/// `corner_length` is the size of the corners
/// `box_width` is the width of the box
/// `box_height` is the height of the box
/// `box_depth` is the depth of the box
/// `wall_thickness` is the thickness of the walls
/// `face_thickness` is the thickness of the top/face
module top(
    corner_length = 10, 
    box_width = 220, 
    box_height = 140, 
    box_depth = 20, 
    wall_thickness = 5,
    face_thickness = 10,
    ) {
    face_thickness = max(1, face_thickness);
       
    difference() {            
        // Set up the 'shell' which is the absolute size of the box.
        linear_extrude(height = box_depth)
        base(corner_length = corner_length, box_width = box_width, box_height = box_height);
        
        // Do a cut out for the inside
        color([1,0,0,1])
        linear_extrude(height = box_depth - face_thickness)
        base(
            corner_length = corner_length, 
            box_width = box_width  - wall_thickness, 
            box_height = box_height  - wall_thickness
        );
    }
}
