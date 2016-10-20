shelfHeight = 18;
spacerSize = 20;
spacerGap = 4;
spacerSpan = 40;
spacerLength = 20;


difference(){
    spacer();
    translate([shelfHeight+spacerSpan, 50 + spacerGap, 0+spacerSpan])
        rotate([0, 0, 90])
            shelf();
    translate([shelfHeight+spacerSpan, 50 + spacerGap, 0+spacerSpan])
        rotate([0, 0, 90])
            %shelf();
}


module spacer(){
    difference(){
        cube(size=[ spacerSpan + shelfHeight-3, spacerSize, shelfHeight+(spacerSpan*2)], center=false);
        translate([spacerSpan+shelfHeight, 0, 2*(spacerSpan+shelfHeight)]) 
            rotate([0, 225, 0])
            cube(size=[ spacerSpan+shelfHeight+spacerGap, spacerSize, shelfHeight+(spacerSpan*2)], center=false);
        translate([11, 0, -(spacerSpan+shelfHeight)]) 
            rotate([0, -45, 0])
            cube(size=[ spacerSpan+shelfHeight+spacerGap, spacerSize, shelfHeight+(spacerSpan*2)], center=false);
        translate([-(shelfHeight + spacerGap* 2), spacerGap, (spacerSpan+shelfHeight + spacerGap)]) 
            cube(size=[ spacerSpan+shelfHeight+spacerGap, spacerSize, shelfHeight+(spacerSpan*2)], center=false);
        translate([-(shelfHeight + spacerGap* 2), spacerGap, -(spacerSpan+shelfHeight + spacerGap)]) 
            cube(size=[ spacerSpan+shelfHeight+spacerGap, spacerSize, shelfHeight+(spacerSpan*2)], center=false);
    }
}


module shelf() {
    translate([-50, 0, 0]) 
        cube(size=[100, 100, shelfHeight], center=false);    
    translate([-50, -1, -50])      
        cube(size=[100, shelfHeight+1, 150], center=false);    
}
