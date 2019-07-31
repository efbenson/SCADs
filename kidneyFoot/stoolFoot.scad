
// 25mm at tightest
base = 5;

difference() {
    oval(28, 40, 15, true);
    translate([0, 0, 5])
        #cube([70,10,15], true);
}



module oval(w,h, height, center = false) {
    scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}
