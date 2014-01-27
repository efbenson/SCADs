// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

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



module corner_base(){        
 translate([-9,-11,0])cube([18,22,47]);
}

module corner_holes(){
 translate([-11,-11,0]){
  // Bottom hole
  translate([0,11,10]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=4.4, $fn=30);
  // Top hole
  translate([0,11,30]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=4.4, $fn=30);
  // Middle hole
  translate([11,0,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=5.4, $fn=30);

  // Washer hole
  translate([11,-3,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 10, r=11, $fn=30);
  translate([11,27,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 10, r=11, $fn=30);
  #translate([25,11,10]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 200, r=8, $fn=30);
  

  // Top smooth rod insert
  // Smooth rod place
  translate([11,2,45]) rotate([0,90,90]) cylinder(h = 270, r=4.2, $fn=30); 
  // Ziptie
  translate([-5,9,39])  cube([30,3.5,2]);
 }
}

module corner_fancy(){
 // Side corner cutouts
  translate([-8,-9,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([8,-9,11]) rotate([0,0,45-180]) translate([-15,0,-1]) cube([30,30,51]);
 // Top corner cutouts
  translate([7,0,49-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,30,30]);
  translate([-7,0,49-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  rotate([0,0,90]){
   translate([-9,0,49-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  }
 // Mount corner cutouts
  translate([40,-9,0]) rotate([0,0,45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([-8,58,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([62,58,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
}

// The mount
module corner_mount(){
	difference(){
		hull(){
			translate([-9,-11,0])
				cube([50,50,5]);	
			translate([-9,-11,5])
				cube([25,25,5]);
	   }
		translate([10,30,16]) rotate([180,0,0])	
		#plate_screw();
		translate([30,13,16]) rotate([180,0,0])	
		#plate_screw();
	}
}


// Final part
module corner(){
 // Rotate the part for better printing
 translate([0,0,11]) rotate([-90,0,0]) difference(){
  union(){
   corner_base();
   corner_mount();
  }
  corner_holes();
  corner_fancy();
 };
}

rotate([90,0,0]) corner();