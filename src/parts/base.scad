/// Creates a base for a fight stick.
/// `corner_length` is the size of the corners
/// `box_width` is the width of the box
/// `box_height` is the height of the box
module base(corner_length = 10, box_width = 220, box_height = 140) {
    module corner() {
        points = [
            [0,0],
            [0,corner_length],
            [corner_length,corner_length],
        ];

        translate([-corner_length / 2, -corner_length / 2,0])
        polygon(points);
    }

    module edge() {   
        // Corner 1
        mirror([1,0,0])
        translate([box_width / 2, 0,0])
        corner();

        // Connector
        connector_width = box_width - 1 * corner_length;

        translate([-connector_width / 2, -corner_length / 2,0])
        polygon([
        [0,0],
        [connector_width,0],
        [connector_width, corner_length],
        [0, corner_length]
        ]);


        // Corner 2
        translate([box_width / 2, 0,0])
        corner();

    }

    module fill() {
        fill_width = box_width + corner_length;
        fill_height = box_height - corner_length;

        translate([-fill_width / 2, -fill_height / 2,0])
        polygon([
            [0,0],
            [fill_width,0],
            [fill_width, fill_height],
            [0, fill_height]
        ]);
    }

    // Bottom side
    translate([0, -box_height / 2,0])
    edge();

    // Top side
    mirror([0,1,0])
    translate([0, -box_height / 2,0])
    edge();

    // Fill it all
    fill();
}
