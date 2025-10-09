// Sheet Music Holder for A4 sheets
// Designed for BambuLab A1 (200x200x200mm build volume)
// Must be printed diagonally

// Parameters
back_width = 214;        // Width of back panel (214mm for A4 + margin)
height = 190;            // Height constraint from printer
wall_thickness = 2;      // Wall thickness
base_depth = 25;         // Depth of the base/lip for sheets to rest on
back_angle = 15;         // Angle of the back support (degrees from vertical)
gutter_height = 8;       // Height of the lip/gutter to hold sheets

// Main module
module sheet_music_holder() {
    difference() {
        // Main body
        union() {
            // Back panel - angled for better viewing
            rotate([back_angle, 0, 0])
                translate([0, -wall_thickness/2, 0])
                    cube([back_width, wall_thickness, height]);
            
            // Base/bottom platform
            cube([back_width, base_depth, wall_thickness]);
            
            // Front lip/gutter to hold sheets
            translate([0, base_depth - wall_thickness, 0])
                cube([back_width, wall_thickness, gutter_height]);
        }
        
        // Optional: small drainage holes in base (in case of moisture)
        for(i = [1:3]) {
            translate([back_width/4 * i, base_depth/2, -1])
                cylinder(h = wall_thickness + 2, d = 3);
        }
    }
    
    // Side supports for additional stability
    // Left side
    translate([0, 0, 0])
        side_support();
    
    // Right side  
    translate([back_width - wall_thickness, 0, 0])
        side_support();
}

// Side support module
module side_support() {
    hull() {
        // Bottom connection point
        cube([wall_thickness, base_depth, wall_thickness]);
        
        // Top connection point (accounting for back panel angle)
        rotate([back_angle, 0, 0])
            translate([0, -wall_thickness, height - 20])
                cube([wall_thickness, wall_thickness, 20]);
    }
}

// Render the holder
sheet_music_holder();

// Print statistics
echo("=== PRINT STATISTICS ===");
echo(str("Back width: ", back_width, "mm"));
echo(str("Height: ", height, "mm"));  
echo(str("Base depth: ", base_depth, "mm"));
echo(str("Diagonal print dimension: ", sqrt(back_width*back_width + base_depth*base_depth), "mm"));
echo(str("Will this fit diagonally in 200mm? ", sqrt(back_width*back_width + base_depth*base_depth) < 200 ? "YES" : "NO"));

// Printing orientation guide
translate([0, -50, 0]) {
    color("red") {
        text("PRINT ORIENTATION:", size=6);
        translate([0, -10, 0])
            text("Rotate 45° on print bed", size=5);
        translate([0, -20, 0])
            text("Use brim for adhesion", size=5);
    }
}