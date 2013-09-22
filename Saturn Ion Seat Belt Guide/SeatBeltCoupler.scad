
difference(){
	translate([-55,-5,-5])
		cube([90,25,40]);

	guide();

	translate([-40,50,15])
		rotate(90,[1,0,0])
			#cylinder(r=5.5,h=80);
	
	rotate(180,[1,0,0])
	translate([-180,-15,-30])
		mount();


	translate([-12,0,0])
	#cube([30,15,30]);
	rotate(90,[1,0,0])
		rotate(90,[0,1,0])
			translate([13,15,-60])
				#difference(){
					cylinder(r=30,h=200);
					translate([0,0,-10])
						cylinder(r=25,h=220);
				}
}
module mount(){


	difference(){
		cube([180,15,30]);
		translate([20,50,15])
		rotate(90,[1,0,0])
			cylinder(r=5.5,h=80);
		translate([175,50,15])
			rotate(90,[1,0,0])
			cylinder(r=12,h=80, $fn=3);
		translate([160,0,15])
			sphere(r=2);
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
				cube([50,20,40]);
	}


	
}

module guide(){
	scaleit =10;
	difference(){
		union(){
			hull(){
				cube([50,15,30]);
				translate([5,0,15])
					sphere(r=2);
				rotate([0,0,90])
					translate([18,-110,20]) scale (v=[1,3,1]) 
						cylinder(h = 1*scaleit, r=2.5*scaleit);
			}
	
			translate([-5,15,15])
			rotate(90,[1,0,0])
				cylinder(r=12,h=15, $fn=3);
		}
	
		rotate([0,0,90])
		translate(v=[20,-120,-5]) scale (v=[1,3,1])
			cylinder(h = 4*scaleit, r=1.8*scaleit);
		rotate([0,0,90])
			translate(v=[20,-120,-5]) 
				cube([3*scaleit,.7*scaleit,4*scaleit]);
	}
}