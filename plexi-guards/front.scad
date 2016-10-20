thickness = 2.25;
lip = 4.75;
coupler = 4.75;
coupleThickness = 2.25;
totThick = (coupleThickness * 2) + thickness;


rotate([180, 0, 0])   
    union (){
        length = 100; 
        coupler(100);
        translate([0, thickness * 2, coupler]) {
            cube(size=[length, lip, thickness]);
        }
    }




module coupler(length=10) {
    difference() {
        cube(size=[length, totThick, coupler + thickness]);
        translate([-5, coupleThickness, -thickness]) 
            cube(size=[length+10, thickness, coupler + thickness]);
    }
}