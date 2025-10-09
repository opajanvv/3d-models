scale([0.9645, 1, 1]) {
difference() {
    import("/home/jan/Documents/3d/Models/music paper stand/Laminated A4 Paper Vertical Stand.stl");
    translate([120, 130, 75.5]) cube([250, 260, 140], center=true);
}
}
// Reference cube for A4 + 2mm clearance (212mm total)
%translate([126.05, 20, 1]) cube([212, 10, 20], center=true);
