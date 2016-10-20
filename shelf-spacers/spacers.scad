shelfHeight = 17.5;
spacerSize = 12;
spacerGap = 4;
spacerLength = 20;


difference(){
    spacer();
    shelf();
}


module spacer(){
    translate([0, 0, -(shelfHeight+6)/2])
        cube(size=[ spacerLength, spacerSize, shelfHeight+6], center=false);
}


module shelf() {
    translate([-50, spacerGap, -shelfHeight/2]) 
        #cube(size=[100, 100, shelfHeight], center=false);    
    #translate([-50, 17, 0]) 
        rotate([45, 0, 0])     
        cube(size=[100, 100, shelfHeight], center=false);    
}
