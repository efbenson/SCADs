//#interlock();



union(){
    getHinge();
    buildPocket();
}

module buildPocket(){
    difference(){
        hull(){
            difference(){
                getHinge();    
                translate([44,-5.5,-7.5])
                    cube([30,30.2,25]);        
            }

            translate([6,3.5,-7])
                    cube([34,12.2,22]);        
        }
        translate([9,5.5,-3])
                cube([30,8.2,19]);
//        translate([0,0,-7])
//                #cube([43,20,22]);

    }
}





module getHinge(){
    difference(){
            getBase();
        translate([-.50,-.50,-7])
            cube([44,21,23]);
        
    }
}


module getBase() {   
    union(){
        translate([45,7.5,37.5])
            import("arm.stl", convexity=3);

        translate([45,7.5,47.5])
            import("arm.stl", convexity=3);
    }
}

module interlock(){
     rotate([0,0,180])
    translate([-75,-12.5,42.5])
        import("arm.stl", convexity=3);   
}