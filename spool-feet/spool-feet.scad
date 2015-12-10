difference(){
	construct();
	translate([30, 0, 16]) 
		rotate([180, 0, 0]) 
			plate_screw();
	translate([-30, 0, 16]) 
		rotate([180, 0, 0]) 
			plate_screw();	
	#cube(size=[30.25, 4.45, 40], center=true);
}


module construct(){
hull(){
	translate([-30, 0, 0]) 
		cylinder(r=10, h=5, center=true);
	translate([30, 0, 0]) 
		cylinder(r=10, h=5, center=true);
	cube(size=[55, 35, 5], center=true);
	translate([0, 0, 15]) 
		cube(size=[40, 20, 5], center=true);	
}}



	
	
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
