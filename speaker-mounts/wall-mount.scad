
difference(){
	// translate([0, 0, 0]) 
	// 	cylinder(r=10, h=125);
	main();
	translate([0,0,-15])
		cube(size=[40, 40, 40], center=true);
	translate([0,0,150])
		cube(size=[40, 40, 40], center=true);
	translate([0,-25,100])
		#cube(size=[40, 40, 40], center=true);
	translate([0,-25,35])
		#cube(size=[40, 40, 40], center=true);
	translate([-2,-65,0])
		#speakerMount();
}


module speakerMount(){
	include <speaker-mount.scad>;	
}

module main(){
	translate([6, -89, 04])
		import("WallMount.stl", convexity=3);
	translate([6, -89, 107])
		import("WallMount.stl", convexity=3);
	translate([-7.6, -89, 131])
		rotate([0, 180, 0])
			import("WallMount.stl", convexity=3);
	translate([-7.6, -89, 28])
		rotate([0, 180, 0])
			import("WallMount.stl", convexity=3);
	translate([-0.77, 13.77, 65])
		cube(size=[30, 5, 50], center = true);
	translate([-0.77, 13.77, 5])
		cube(size=[30, 5, 50], center = true);
	translate([-0.77, 13.77, 125])
		cube(size=[30, 5, 50], center = true);
}