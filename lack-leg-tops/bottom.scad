

difference() {
    mount();
    translate([5, 5, 30]) 
        leg();
    translate([80, 30, 15])
        rotate([180, 0, 0])
            #plate_screw(30);
    translate([30, 80, 15])
        rotate([180, 0, 0])
            #plate_screw(30);
}

module mount() {
    cube(size=[61, 61, 50]);
    hull(){
        translate([80, 30, 0]) 
            mountPoint();
        rotate([0, 0, 90]) 
            translate([80, -30, 0]) 
                mountPoint();
    }
    
}

module mountPoint() {
    hull() {
        cylinder(r=10, h=10);
        translate([-20, 0, 0]) 
            cylinder(r=10, h=50);
    }
}

module leg() {
    #cube(size=[51, 51, 100]);
}


	
module screw(h=20, r=2, r_head=3.5, head_drop=0, slant=i_am_box, poly=false, $fn=0){
    //makes screw with head
    //for substraction as screw hole
    if (poly) {
        cylinder_poly(h=h, r=r, $fn=$fn);
    } else {
        cylinder(h=h, r=r, $fn=$fn);
    }
    if (slant) {
        translate([0, 0, head_drop-0.01]) cylinder(h=r_head, r2=0, r1=r_head, $fn=$fn);
    }

    if (head_drop > 0) {
        translate([0, 0, -0.01]) cylinder(h=head_drop+0.01, r=r_head, $fn=$fn);
    }
}

module plate_screw(long=0) {

        translate([0, 0, -2 - long]) screw(head_drop=14 + long, h=30 + long, r_head=4.5, r=2, $fn=24, slant=true);
    
}