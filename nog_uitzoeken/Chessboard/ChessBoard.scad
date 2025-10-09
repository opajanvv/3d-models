//Select which element you want to create the stl for..
// for a full chess board (64 squares) you will need:
// 2 corner_tile of each color
// 14 edge_tile of each color
// 16 center_tile of each color
// 112 lock rings (color doesn't matter)

//center_tile();
//corner_tile();
//edge_tile();
lock_ring();


module frame()
{
    linear_extrude(height=5) difference(){
        square(size=45, center = true);
        square(size=39, center = true);
    }
    linear_extrude(height=2) difference(){
        square(size=39, center = true);
        square(size=33, center = true);
    }
}

module circle()
{
    $fn = 35;
    difference(){
        cylinder(h=2, d=19);
        cylinder(h=2, d=16);
    }
} 

module lock_post()
{
    difference(){
        cylinder(h=3, d=12);
        cylinder(h=3, d=8);
    }
}      

module lock_ring()
{
    difference(){
        cylinder(h=2.4, d=11.6);
        cylinder(h=2.4, d=8);
//        cylinder(h=2.4, d=8.3);
    }
}      

module center_tile()
{
    difference(){
        frame();    
        translate([-22.5,0,2]) lock_post();
        translate([22.5,0,2]) lock_post();
        translate([0,22.5,2]) lock_post();
        translate([0,-22.5,2]) lock_post();
    }   
    translate([-10,-10,0]) circle();
    translate([-10,0,0]) circle();
    translate([-10,10,0]) circle();
    
    translate([0,-10,0]) circle();
    translate([0,0,0]) circle();
    translate([0,10,0]) circle();
    
    translate([10,-10,0]) circle();
    translate([10,0,0]) circle();
    translate([10,10,0]) circle();
}

module corner_tile()
{
    difference(){
        frame();    
        translate([-22.5,0,2]) lock_post();
        translate([0,-22.5,2]) lock_post();
    }   
    translate([-10,-10,0]) circle();
    translate([-10,0,0]) circle();
    translate([-10,10,0]) circle();
    
    translate([0,-10,0]) circle();
    translate([0,0,0]) circle();
    translate([0,10,0]) circle();
    
    translate([10,-10,0]) circle();
    translate([10,0,0]) circle();
    translate([10,10,0]) circle();
}

module edge_tile()
{
    difference(){
        frame();    
        translate([-22.5,0,2]) lock_post();
        translate([0,-22.5,2]) lock_post();
        translate([0,22.5,2]) lock_post();
    }  
    
    translate([-10,-10,0]) circle();
    translate([-10,0,0]) circle();
    translate([-10,10,0]) circle();
    
    translate([0,-10,0]) circle();
    translate([0,0,0]) circle();
    translate([0,10,0]) circle();
    
    translate([10,-10,0]) circle();
    translate([10,0,0]) circle();
    translate([10,10,0]) circle();
}

//center_tile();
//corner_tile();
//edge_tile();
lock_ring();
