

difference() {
    rotate([180, 0, 0])
        translate([-8.5, -8.5, 0]) 
            import("Handle_female_base.STL", convexity=3);
    difference() {
        cylinder(r=20, h=15, center=true);
        cylinder(r=6.15, h=15, center=true, $fn=50);
    }
}