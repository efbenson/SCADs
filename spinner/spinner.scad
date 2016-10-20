
bearingHeight= 7;
bearingRadius= 11.2;
wall= 5;
armLength = 27.5;
armAngle = 1.6;
roundedCorners = true;
roundedCornerDepth = 19.5;
roundedCornerRadius = 6;
grips = true;
gripRadius = 1.5;
gripCount = 3;
gripSpan = 20;

body();

//arm();

module body() {
    difference () {
        union(){
            arms();
            translate([-bearingRadius-wall, -bearingRadius-wall, 0])            
            disc();
        }
        translate([0, 0, -bearingHeight/2])
            bearing();
        if (roundedCorners) {
            rotate([0, 0, 60])
                translate([0,-roundedCornerDepth,-bearingHeight/2])
                cylinder(r=roundedCornerRadius, h=bearingHeight);               
            rotate([0, 0, 180])
                translate([0,-roundedCornerDepth,-bearingHeight/2])
                cylinder(r=roundedCornerRadius, h=bearingHeight);               
            rotate([0, 0, 300])
                translate([0,-roundedCornerDepth,-bearingHeight/2])
                cylinder(r=roundedCornerRadius, h=bearingHeight);               
        }
    }
}



module arms() {
    translate([0,-armLength,0])
        arm();
    rotate([0, 0, 120])
        translate([0,-armLength,0])   
            arm();
    rotate([0, 0, -120])
        translate([0,-armLength,0])   
            arm();
}

module arm() {
    difference(){
        hull() {
            translate([-bearingRadius-wall, -bearingRadius-wall, 0])
                disc();
            translate([0,armLength,-bearingHeight/2])
                cylinder(r=bearingRadius/armAngle, h=bearingHeight);
        }
        grips();
        translate([0,0, -bearingHeight/2]) 
            bearing();
    }
}

module disc() {
    difference() {
        discRadius = bearingRadius+wall;
        discExtrusion = discRadius * 1;
        translate([bearingRadius+wall,bearingRadius+wall])
            resize(newsize=[discRadius * 2,discRadius * 2 ,discExtrusion])
            sphere(r=bearingRadius+wall);
        translate([0,0,bearingHeight/2])
            cube(size=[50, 50, 30]);
        translate([0,0,(-bearingHeight/2) - 30])
            cube(size=[50, 50, 30]);
    }
}

module grips() {
    if (grips) {
        discRadius = bearingRadius+wall;
        translate([0,0, -bearingHeight/2]) {
            translate([0,-discRadius])
                cylinder(r=gripRadius, h=10, $fn=30);
            for ( i = [1:gripCount] ) {
                rotate([0,0,i * gripSpan])
                    translate([0,-discRadius])
                        cylinder(r=gripRadius, h=10, $fn=30);
                rotate([0,0,-i * gripSpan])
                    translate([0,-discRadius])
                        cylinder(r=gripRadius, h=10, $fn=30);
            }
        }
    }
}

module bearing() {
    cylinder(r=bearingRadius, h=bearingHeight);
}


