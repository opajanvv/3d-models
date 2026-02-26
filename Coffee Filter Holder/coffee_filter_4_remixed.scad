show_cube = true;

module holder() {
    translate([-50, -25, 0])
    rotate([90, 0, 0])
    // import the original design from
    // https://www.thingiverse.com/thing:2639105
    import("Coffee_filter_holder_-_No._4.stl");
}

// The idea is to make two copies of the holder
// Then cut off everything except the lower end of a foot
// And then shift the remaining part to its new position

module right_foot() {
    cube_x = 80;
    cube_y = 80; 
    cube_z = 35;
    
    translate_x = 50;
    translate_y = -100;
    translate_z = -7;
    
    intersection() {
        holder();
        
        translate([translate_x, translate_y, translate_z])
        cube([cube_x, cube_y, cube_z]);
    }
    
    // Optionally show the cutting cube
    if (show_cube) {
        color("green", 0.25)
        translate([translate_x, translate_y, translate_z])
        cube([cube_x, cube_y, cube_z]);
    }
}

module left_foot() {
    cube_x = 80;
    cube_y = 80; 
    cube_z = 35;
    
    translate_x = -100;
    translate_y = -100;
    translate_z = -7;
    
    intersection() {
        holder();
        
        translate([translate_x, translate_y, translate_z])
        cube([cube_x, cube_y, cube_z]);
    }
    
    // Optionally show the cutting cube
    if (show_cube) {
        color("green", 0.25)
        translate([translate_x, translate_y, translate_z])
        cube([cube_x, cube_y, cube_z]);
    }
}

// Comment out the first line to see the additional feet

holder();
translate([-128.5, 0, 0]) right_foot();
translate([128.5, 0, 0]) left_foot();