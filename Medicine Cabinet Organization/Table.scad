// Leg dimensions
pegHeight = 0;
totalHeight = 20;
legRadius = 5;

//table dimensions
width = 180;
height = 10;
depth = 75;
borderPadding = 3;
pegOffsetFromTop = 4;
hollow = true;
hollowAmount = 8;
hollowPadding = 3;

//Vars
legPadding = legRadius + borderPadding;
legHeight = height-totalHeight-pegOffsetFromTop;
fullHollowPadding = ((legRadius*3.5) + borderPadding) + hollowPadding;
hollowWidth = width - (fullHollowPadding * 2);
hollowDepth = depth - (fullHollowPadding * 2);
hollowHeight = hollowAmount+1;


difference(){
	cube([depth,width,height]);
	translate([legPadding , legPadding , legHeight])
		leg();
	translate([depth-legPadding, legPadding , legHeight])
		leg();
	translate([depth-legPadding, width-legPadding , legHeight])
		leg();
	translate([legPadding, width-legPadding , legHeight])
		leg();
	if(hollow==true){
		hull(){
		translate([fullHollowPadding , hollowPadding , -1])
		#cube([hollowDepth,(width-(hollowPadding*2)),hollowHeight]);
		translate([hollowPadding , fullHollowPadding, -1])
		#cube([(depth-(hollowPadding*2)),hollowWidth,hollowHeight]);
}
	}
}




module leg(){
	difference(){
		cylinder(r=legRadius, h=totalHeight);
		if (pegHeight > 0){
			translate([0,0,totalHeight-pegHeight])
			difference(){
				cylinder(r=legRadius+1, h=pegHeight+1);
				cylinder(r=legRadius/2, h=pegHeight+1, $fn=4);
			}
		}
	}
}