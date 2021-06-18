/*
This is a generic screw cutout for the fight stick.
*/

// Screws
module screw(
    screw_diameter
    ) {
    screw_diameter = max(1, screw_diameter);
    circle(screw_diameter, true);
}

/// Creates screws/screw holders for a fight stick.
module screws(is_holder = false, corner_length = 10, box_width = 220, box_height = 140, screw_diameter=5, holder_thickness=6, screw_height=200) {
    module corner() {
        diameter = is_holder ? screw_diameter + holder_thickness : screw_diameter;
        x_offset =  screw_diameter + holder_thickness;
        y_offset =  screw_diameter + holder_thickness;
        translate([x_offset, y_offset,0])
        screw(diameter);
    }

    module edge() {   
        // Corner 1
        mirror([1,0,0])
        translate([box_width / 2, 0,0])
        corner();

        // Connector
        connector_width = box_width - 1 * corner_length;

        // Corner 2
        translate([box_width / 2, 0,0])
        corner();

    }

    linear_extrude(height=screw_height)
    {
        // Bottom side
        translate([0, -box_height / 2, 0])
        edge();

        // Top side
        mirror([0,1,0])
        translate([0, -box_height / 2, 0])
        edge();
    }
}
