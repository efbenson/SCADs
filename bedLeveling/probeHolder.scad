

m3Nut = 5.5 / 2 / cos(180 / 6) + 0.05;

difference() {
    translate([-20, -3, -45])
        mount();
    rotate([0, 180, 0]) 
        #bracket();

    rotate([90, 0, 0])
        translate([-6.5, -41 + 6.5, -25]) {
            cylinder(r=1.5, h=50, $fn=30);
            cylinder(r=m3Nut, h=10, $fn=6);
        }
    rotate([90, 0, 0])
        translate([-17 + 6.5, -41 + 24, -25]) {
            cylinder(r=1.5, h=50, $fn=30);
            cylinder(r=m3Nut, h=11, $fn=6);
        }
        
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
                    translate([-30, 55, 0])                        
                    translate([11.5, -18, -5]) 
                        cylinder(r=14, h=10);
                }
                union() {
                    hull() {
                        translate([0, 0, -5]) 
                            #cube(size=[23, 10, 40]);
                        translate([-15, 39, 0])                        
                        translate([11.5, -18, -5]) 
                            cylinder(r=13, h=10);
                    }                    
                }
        }
        translate([-30, 55, 0]) {
            translate([11.5, -18, -5]) { 
                #cylinder(r=9.25, h=30);
                translate([0, 0, 10])
                #cylinder(r=15.0, h=30);
            }
        }
    }
}