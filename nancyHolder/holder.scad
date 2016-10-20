platformHeight = 17.5;
spacerSize = 12;
spacerGap = 4;
spacerLength = 20;


difference(){
    platform();
    translate([22, 185, 3]) 
        bottle(20);
    translate([66, 185, 3]) 
        bottle(22.5);
    union() {
        xOffset = -11;
        yOffset = -15;
        for(x = [ 1 : 3]) {
            for(y = [1 : 5]) {
                xVal = xOffset + (x * 28);
                yVal = yOffset + (y * 32);
                if (x == 2) {
                    if (y < 5) {
                        translate([xVal,yVal + 15, 3])
                            bottle(15);
                    }
                } else {
                    translate([xVal ,yVal, 3])
                        bottle(15);
                }
            }
        }
    }
}


module bottle(radius){
    cylinder(r=radius, h=60, center=false);
}


module platform() {
    hull() {
        translate([10, 10, 0])
            cylinder(r=10, h=platformHeight);
        translate([80, 200, 0])
            cylinder(r=10, h=platformHeight);
        translate([80, 10, 0])        
            cylinder(r=10, h=platformHeight);
        translate([10, 200, 0])        
            cylinder(r=10, h=platformHeight);
    }

    //cube(size=[90, 210, platformHeight], center=false);    
}
