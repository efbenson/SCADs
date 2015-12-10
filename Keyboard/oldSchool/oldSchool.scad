use <Write.scad>;

difference(){    
    translate([-8, -26.9, -4.5]) 
        import("keycap-blank.stl", convexity=13);    
    scale(.7,.7)
        rotate([180,0,0])
            #write("ctrl",h=6,t=3);
}   
    
    