
difference(){
    union(){
        import("SpeakerMount.stl", convexity=3);
        translate([3, 0, 135]) 
            rotate([0, 180, 0]) 
                import("SpeakerMount.stl", convexity=3);
    }
    translate([0, -12.6, 0]) 
        cube(size=[100, 100, 300], center=true);
    translate([1.5, 0, 82.5]) 
        cube(size=[23, 100, 25], center=true);
}