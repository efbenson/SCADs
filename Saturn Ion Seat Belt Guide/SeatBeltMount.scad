
difference(){
	cube([180,15,30]);
	translate([20,50,15])
	rotate(90,[1,0,0])
		#cylinder(r=5.5,h=80);
	translate([140,50,15])
	rotate(90,[1,0,0])
		#cylinder(r=5.5,h=80);
	translate([175,50,15])
		rotate(90,[1,0,0])
		#cylinder(r=12,h=80, $fn=3);
	translate([160,0,15])
		#sphere(r=2);
	rotate(90,[1,0,0])
		rotate(90,[0,1,0])
			translate([-10,15,-40])
				difference(){
					cylinder(r=30,h=200);
					translate([0,0,-10])
						cylinder(r=25,h=220);
				}
	rotate(45,[0,0,1])
		translate([-14,3,00])
			#cube([50,20,40]);
}

