
height = 119;
faceWidth = 104.125;
faceDepth = 133.31;
spineDepth = faceDepth * 1.90;
spineWidth = faceWidth * 0.38;
spineOffset = faceWidth * 0.41;
stackRadius = 22;
stackRadiusTop = 15;
stackHeight = height * 3.683229814;
capHeight = height * 0.1552795031;

sideHeight = height*.8;
leftWidth = faceWidth * 1.21;
rightWidth = faceWidth * .416;

crownWidth = 4;
crownHeight = 5;

//cube(size=[width, depth, height], center=false);
//translate([-width * leftWidthScale, 0, 0]) 
//	#cube(size=[width*leftWidthScale, depth, height], center=false);

difference(){
	coreStructure();
		cube(size=[10, stackRadius, height], center=false);
}

module coreStructure(){
	union(){
		faceBuilding();
		translate([spineOffset, faceDepth, 0]) 
			spine();
		// translate([spineOffset - stackRadius, faceDepth + spineDepth-stackRadius, 0]) 
		// 	stack();
		// translate([spineOffset + spineWidth+ stackRadius , faceDepth + spineDepth-stackRadius, 0]) 
		// 	stack();
		translate([-spineOffset - spineWidth, stackRadius, 0]) 
			leftBuilding();
		translate([+spineOffset + spineWidth, faceDepth, 0]) 
			rightBuilding();
	}
}

module faceBuilding(){
	union(){
		difference(){
			cube(size=[faceWidth, faceDepth, height], center=false);
			translate([crownWidth, crownWidth, height-crownHeight]) 
				cube(size=[faceWidth-crownWidth*2, faceDepth-crownWidth*2, crownHeight*2], center=false);		
		}
		translate([crownWidth, crownWidth, 0]) 
				cube(size=[10, stackRadius, height], center=false);
	}
}

module spine(){
	difference(){
		cube(size=[spineWidth, spineDepth, height], center=false);	
		translate([crownWidth, 0, height-crownHeight]) 
			cube(size=[spineWidth-crownWidth*2, spineDepth-crownWidth, crownHeight*2], center=false);	
	}
}
module stack(){
	difference(){
		union(){		
			cylinder(r1=stackRadius, h=stackHeight-capHeight, r2=stackRadius*.6, center=false);
			translate([0, 0, stackHeight-capHeight]) 
				cylinder(r1=stackRadius*.6, h=capHeight, r2=stackRadiusTop, center=false);
		}
		translate([0, 0, stackHeight-capHeight*2])
			#cylinder(r=stackRadius*.5, h=capHeight*2,center=false);		
	}
}

module leftBuilding(){
	difference(){
		cube(size=[leftWidth, (faceDepth + spineDepth) - stackRadius*3, sideHeight], center=false);	
		translate([crownWidth, crownWidth, sideHeight-crownHeight]) 
			cube(size=[leftWidth-crownWidth, ((faceDepth + spineDepth) - stackRadius*3) - crownWidth * 2, crownHeight * 2], center=false);	
	}
}

module rightBuilding(){
	difference(){
		cube(size=[rightWidth, spineDepth - stackRadius * 2, sideHeight], center = false);
		translate([0, crownWidth, sideHeight-crownHeight]) 
			cube(size=[rightWidth-crownWidth, (spineDepth - stackRadius * 2) - crownWidth * 2, crownHeight*2], center = false);
	}
}

