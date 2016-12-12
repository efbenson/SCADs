hole = 37.33;




plug();
translate([0, 0, 15]) {
    top();
}


module plug() {
    difference() {
        cylinder(r=hole/2, h=15, $fn=100);
        cylinder(r=(hole/2) - 2.5, h=15);
    }
}

module top() {
    difference() {
        topShell();
        scale([.8, .8, .8]) {
            topShell();
        }
        translate([-50, -3, 3]) {
            slices();
        }
        #cylinder(r=(hole/4)-2, h=40);
    }
}

module topShell() {
    hull() {
        difference() {
            cylinder(r=(hole/2) + 2.5, h=3);
            cylinder(r=(hole/2), h=15);
        }
        translate([0, 0, 20]) {
                cylinder(r=(hole/4) , h=3);
        }
    }
}

module slices() {
    slice();
    translate([0, -51.5, 0]) 
        rotate([0, 0, 45]) {
            slice();
        }
    translate([0, 48.5, 0]) 
        rotate([0, 0, -45]) {
            slice();
        }
    translate([53, -50, 0]) 
        rotate([0, 0, 90]) {
            slice();
        }
}

module slice() {
    hull() {
        translate([0, -3, 0])
            cube(size=[100, 12, 2]);
        translate([0, 0.5, 18]) 
            cube(size=[100, 5, 1]);
    }
}