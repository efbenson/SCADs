
difference(){
	translate([-25,-5,-5])
		cube([50,25,40]);

	guide();
	
	rotate(180,[1,0,0])
	translate([-180,-15,-30])
		mount();
	translate([-12,0,0])
	#cube([30,15,30]);
}
module mount(){

	difference(){
		cube([180,15,30]);
		translate([20,50,15])
		rotate(90,[1,0,0])
			cylinder(r=5.5,h=80);
		translate([140,50,15])
		rotate(90,[1,0,0])
			cylinder(r=5.5,h=80);
		translate([175,50,15])
			rotate(90,[1,0,0])
			cylinder(r=12,h=80, $fn=3);
		translate([160,0,15])
			sphere(r=2);
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
					translate([18,-120,0]) scale (v=[1,3,1]) 
						cylinder(h = 3*scaleit, r=2.5*scaleit);
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