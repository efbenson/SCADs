//110
pegHeight = 0;
totalHeight = 75;
legRadius = 5;


difference(){
	cylinder(r=legRadius, h=totalHeight);
	translate([0,0,totalHeight-pegHeight])
	difference(){
		cylinder(r=legRadius+1, h=pegHeight+1);
		cylinder(r=legRadius/2, h=pegHeight+1, $fn=4);
	}
}