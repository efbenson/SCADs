
wheelWidth=5;
wheelDiameter=21;
axelPadDiameter = 11;
axelPadwidth = 9;
axelDiameter = 5;
hubSpacerWidth = 2;
HubSpacerDiameter = 10;


difference() {
    wheel();
    cylinder(r=((axelDiameter/2)), h=(axelPadwidth+wheelWidth)*2, center=true, $fn=100);
    translate([0,0,-(wheelWidth/2)+(hubSpacerWidth/2)])
    #cylinder(r=((HubSpacerDiameter/2)), h=hubSpacerWidth, center=true, $fn=100);
}

module wheel() {
    cylinder(r=((wheelDiameter/2)-(wheelWidth/2)), h=wheelWidth, center=true);
    Torus(wheelWidth, wheelDiameter);
    translate([0,0,wheelWidth/2])
    cylinder(r=((axelPadDiameter/2)), h=axelPadwidth, center=true, $fn=100);
}

module Torus(R1,R2)
{
    RA=R1      /2;           // Radius   of  Torus
    RB=R2      /2 - R1/2 ;     // Radius   of  Torus overall 
        
    rotate_extrude(convexity = 10, $fn = 144) // the value is the sides the finer
    translate([RB, 0, 0])
    circle(r = RA, $fn = 144); // the value is the sides
}
