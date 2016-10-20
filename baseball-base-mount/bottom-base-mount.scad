

difference() {
    mount();
    translate([7,0,-7])
        bracket();
}

module mount() {
    cube(size=[31, 10, 45]);
    rotate([-90, 0, 0])
        translate([0, -3, 0]) 
            cube(size=[31, 10, 70]);
    translate([0, 62.75, 0]) 
        rotate([-45, 0, 0])
            #cube(size=[31, 10, 25]);                
}


module bracket() {
    #cube(size=[17, 3, 41]);
    rotate([-90, 0, 0])
        translate([0, -3, 0]) 
            cube(size=[17, 3, 41]);
    
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