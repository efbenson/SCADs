poleDia = 14;
SpoolDia = 45;
SpoolWidth = 75;


difference(){
    holder();
    pole();
}


module holder(){
    rotate([90, 0, 90])
        cylinder(r=SpoolDia/2, h=SpoolWidth+10, center=true);    
    rotate([90, 0, 90])
        translate([0, 0, (SpoolWidth/2)+10])        
            cylinder(r=(SpoolDia/2) + 10, h=10, center=true);    
    difference(){
        rotate([90, 0, 90])
            translate([0, 0, -(SpoolWidth/2)-15])        
                cylinder(r=(SpoolDia/2), h=20, center=true);
        rotate([90, 0, 90])
            translate([0, 0, -(SpoolWidth/2)-20])        
                cylinder(r=(SpoolDia/2)-5, h=25, center=true);
        translate([-(SpoolWidth/2)-17, 0, 0])        
            cylinder(r=4, h=100, center=true);
        translate([-(SpoolWidth/2)-17, 0, 0])
            rotate([90, 0, 0])        
            cylinder(r=4, h=100, center=true);                    
                                
    }
}


module pole(){
    rotate([90, 0, 90])
        cylinder(r=poleDia/2, h=SpoolWidth+50, center=true);    
}
