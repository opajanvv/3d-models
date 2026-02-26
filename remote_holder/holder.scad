// Remote Control Holder for Bedside
// Basket dimensions: 20cm high, 10cm wide, 4cm deep
// Hooks fit around bamboo branch with 12.5cm diameter

// Define dimensions
basket_height = 200;  // 20cm = 200mm (OpenSCAD uses mm)
basket_width = 100;   // 10cm = 100mm
basket_depth = 40;    // 4cm = 40mm

branch_diameter = 125;  // 12.5cm = 125mm
branch_radius = branch_diameter / 2;  // Calculate radius: 62.5mm
hook_clearance = 5;  // Extra space for easy fit: 5mm
hook_inner_radius = branch_radius + hook_clearance;  // Inner radius of hook: 67.5mm
hook_thickness = 5;  // Thickness of hook material: 5mm
hook_width = 20;  // Width of each hook: 20mm

// Main basket (open box)
// difference() subtracts the inner box from the outer box to create walls
difference() {
    // Outer box - the full size of the basket
    cube([basket_width, basket_depth, basket_height]);
    
    // Inner box - subtract this to create the hollow interior
    // translate() moves the inner box slightly inward to create wall thickness
    translate([2, 2, 2])  // 2mm wall thickness on all sides
        cube([basket_width - 4, basket_depth - 4, basket_height - 2]);  // Leave 2mm bottom
}

// Left hook (on the left side at x=0, at the top)
// Position at left edge, at the top edge
translate([12.5, basket_depth - 107, basket_height - 4])  // Left edge, center of depth, at top
    rotate([90, 0, 0])  // Rotate 90 degrees around X axis
        rotate([0, 90, 0])  // Rotate hook to face sideways (around Y axis)
            hook();

// Right hook (mirrored from left hook)
// Position mirrored to the right side
translate([basket_width - 12.5, basket_depth - 107, basket_height - 4])  // Right side, mirrored X position
    rotate([90, 0, 0])  // Rotate 90 degrees around X axis
        rotate([0, -90, 0])  // Rotate hook to face sideways in opposite direction (around Y axis, mirrored)
            hook();

// Hook module definition
// This creates a reusable hook shape that extends upward from the basket top
module hook() {
    // The hook extends upward and curves to wrap around the branch above the basket
    // Move the hook upward so the curved part is above the basket top
    translate([0, 0, hook_inner_radius])  // Move up by the hook radius to position it above basket
        difference() {
            // Outer cylinder - the full hook shape
            // rotate_extrude() creates a 3D shape by rotating a 2D profile around an axis
            // The axis is vertical (Z), and we rotate 180 degrees to create a half-circle hook
            rotate_extrude(angle = 180)  // Rotate 180 degrees to create a half-circle
                translate([hook_inner_radius, 0, 0])  // Move the profile outward from the axis
                    square([hook_thickness, hook_width]);  // 2D profile: thickness x width
            
            // Inner cylinder - subtract this to create the hollow interior for the branch
            translate([0, 0, -1])  // Slight offset to ensure clean subtraction
                cylinder(h = hook_width + 2, r = hook_inner_radius);  // Hollow interior
        }
}

