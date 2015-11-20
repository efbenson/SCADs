
union(){
    trimmed();
    arm();
    extended();
}

module extended(){
    difference(){
        translate([-15.5,-38,])
            cube([4.5,13,10]);    
        translate([-16.5,-30,5])
            rotate([0,90,0])
            cylinder(10, d=3, $fn=24);
        translate([-15,-30,5])
            rotate([0,90,0])
            cylinder(5, d1=0, d2=5, $fn=24);
        
    }
}

module arm(){
    hull(){
        difference(){
            trimmed();
            translate([-4.6,-1.7,-.25])
                    cube([10,16,10.5]);    
            translate([-16,-27,-.25])
                    cube([10,13,10.5]);    
        }
    }
}

module getBase() {   
    import("part1.stl", convexity=3);
    translate([-5,3.5,-4.88])
        cube([1,5,10]);
}

module trimmed(){
        difference(){
            union (){
                rectified();
                translate([-13,-13,0])
                    cube([10,7,10]);
            }
            translate([-11,-13,,-.25])
                rotate([0,0,-45])
                    cube([10,16,10.5]);
            translate([-11,-23,-.25])
                rotate([0,0,-45])
                    cube([10,16,10.5]);
            translate([-15,-19.56,5])
                rotate([0,90,0])
                    cylinder(5, d1=0, d2=5, $fn=24);

        }
}

module rectified(){
    translate([0,0,5.115])
        rotate([0,180,0])
        difference(){   
            getBase();
            translate([3.5,3.5,-4.9])
                cube([1,5,10.1]);
        }   
}