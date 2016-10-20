holeFromCenter = 25;
holeRadius = 3.5/2;
height = 4;
postHeight = 3;
grillExtended = 4;
grillHoleWidth = 8;
grillHoleFn = 6;
grillHolePadding = -1;
magicRowOffset = 1.5;
magicHeightOffset = .1;
cutoutHeight = 2;

module correctedPlate() {
    //hull(){
        translate([holeFromCenter, holeFromCenter, -height/2])
            cylinder(r=holeRadius * 3.5, h=height + postHeight);
        translate([-holeFromCenter, holeFromCenter, -height/2])
            cylinder(r=holeRadius * 3.5, h=height + postHeight);
        translate([holeFromCenter, -holeFromCenter, -height/2])
            cylinder(r=holeRadius * 3.5, h=height + postHeight);
        translate([-holeFromCenter, -holeFromCenter, -height/2])
            cylinder(r=holeRadius * 3.5, h=height + postHeight);
        translate([0, 0, 0])    
            cylinder(r=holeFromCenter+grillExtended+5.5, h=height, center=true);
    //}
}



module grill(){
    intersection() {
        translate([0, 0, 1]) 
            cylinder(r=holeFromCenter+grillExtended, h = height+3, center=true, $fn=100);
        union() {
            step = grillHoleWidth +  grillHolePadding;
            for(i = [-holeFromCenter - grillHoleWidth *2  : step : holeFromCenter + grillHoleWidth *2])
            {
                heightOffset = (i/step) * magicHeightOffset;
                offset = ((floor(i / step)) % 2 == 0 ? +magicRowOffset :  -magicRowOffset) ;
                
                for(j = [-holeFromCenter - grillHoleWidth *2 : (grillHoleWidth +  grillHolePadding) : holeFromCenter + grillHoleWidth *2]){
                    translate([i + heightOffset,j + offset,0])
                        cylinder(r=grillHoleWidth/2, h=height+3, center=true, $fn=grillHoleFn);
                }
            }
        }
    }
}

difference(){
    correctedPlate();
    grill();
    translate([holeFromCenter, holeFromCenter, 0]) 
        cylinder(r=holeRadius, h=10, center=true, $fn=18);
    translate([-holeFromCenter, holeFromCenter, 0]) 
        cylinder(r=holeRadius, h=10, center=true, $fn=18);
    translate([-holeFromCenter, -holeFromCenter, 0]) 
        cylinder(r=holeRadius, h=10, center=true, $fn=18);
    translate([holeFromCenter, -holeFromCenter, 0]) 
        cylinder(r=holeRadius, h=10, center=true, $fn=18);
    cylinder(r=holeFromCenter+grillExtended, h = cutoutHeight+.1, center=false, $fn=100);
}
