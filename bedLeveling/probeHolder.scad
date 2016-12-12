

difference() {
    translate([-20, -3, -45])
        mount();
    rotate([0, 180, 0]) 
        #bracket();

    rotate([90, 0, 0])
        translate([-6.5, -41 + 6.5, -15])
        cylinder(r=1.5, h=20, $fn=30);
    rotate([90, 0, 0])
        translate([-17 + 6.5, -41 + 24, -15])
        cylinder(r=1.5, h=20, $fn=30);
}


// 7.5
// 6.5
// 24

module bracket() {
    #cube(size=[17, 3, 41]);
    rotate([-90, 0, 0])
        translate([0, -3, 0]) 
            cube(size=[17, 3, 41]);
    
}


module mount() {
    difference() {
        union() {
            cube(size=[23, 10, 35]);
            hull(){
                translate([0, 0, -5]) 
                    cube(size=[23, 10, 10]);
                translate([11.5, -18, -5]) 
                    cylinder(r=14, h=10);
            }
        }
        translate([11.5, -18, -5]) 
        #cylinder(r=9.25, h=10);
    }
}