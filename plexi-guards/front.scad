thickness = 2.70;
lip = 4.75;
coupler = 4.75;
coupleThickness = 2.25;
totThick = (coupleThickness * 2) + thickness;


rotate([180, 0, 0])   
    coupled(200);

module coupled(length) {
    difference(){ 
        union (){
            coupler(length);
            translate([0, thickness * 2, coupler]) {
                cube(size=[length, lip, thickness]);
            }
        }
        translate([-35,-5,0])
            rotate([0, 45, 0]) 
                #cube(size=[30, 30, 30]);
        
        translate([length - 7.46,-5,coupler + thickness])
            rotate([0, 45, 0]) 
                #cube(size=[30, 30, 30]);
    }
}


module coupler(length=10) {
    difference() {
        cube(size=[length, totThick, coupler + thickness]);
        translate([-5, coupleThickness, -thickness]) 
            cube(size=[length+10, thickness, coupler + thickness]);
    }
}