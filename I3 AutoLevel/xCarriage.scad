// PRUSA iteration3
// X ends
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3

// ThingDoc entry
/**
 * @id xMotorEnd
 * @name X Axis Motor End
 * @category Printed
 */
 
/**
 * @id xIdlerEnd
 * @name X Axis Idler End
 * @category Printed
 */
 
include <configuration.scad>
use <limitswitch.scad> 
use <bushing.scad> 
use <inc/bearing-guide.scad>
use <y-drivetrain.scad>

//height and width of the x blocks depend on x smooth rod radius
x_box_height = 52 + 2 * bushing_xy[0];
x_box_width = (bushing_xy[0] <= 4) ? 17.5 : bushing_xy[0] * 2 + 9.5;
bearing_height = max ((bushing_z[2] > 30 ? x_box_height : (2 * bushing_z[2] + 8)), x_box_height);

module x_end_motor(){

    mirror([0, 1, 0]) {

        x_end_base([3, 3, min((bushing_xy[0] - 3) * 2, 3), 2], len=42, offset=-5, thru=false);


        translate([0, -z_delta - 2, 0]) difference(){
            union(){
                intersection() {
                    translate([-15, -34, 30]) cube([20, 60, x_box_height], center = true);
                    union() {
                        translate([-14, -16 + z_delta / 2, 24]) cube_fillet([17.5, 10.5 + z_delta, 55], center = true, vertical=[0, 0, 3, 3], top=[0, 3, 6, 3], $fn=16);
                        //lower arm holding outer stepper screw
                        translate([-10.25, -34, 9]) intersection(){
                            translate([0, 0, -5]) cube_fillet([10, 37, 28], center = true, vertical=[0, 0, 0, 0], top=[0, 3, 5, 3]);
                            translate([-10/2, 10, -26]) rotate([45, 0, 0]) cube_fillet([10, 60, 60], radius=2);
                        }
                    }
                }
                translate([-16, -32, 30.25]) rotate([90, 0, 0])  rotate([0, 90, 0]) nema17(places=[1, 0, 1, 1], h=11);
            }

            // motor screw holes
            translate([21-5, -21-11, 30.25]){
                // belt hole
                    translate([-30, 11, -0.25]) cube_fillet([11, 36, 22], vertical=0, top=[0, 1, 0, 1], bottom=[0, 1, 0, 1], center = true, $fn=4);
                //motor mounting holes
                translate([-29.5, 0, 0]) rotate([0, 0, 0])  rotate([0, 90, 0]) nema17(places=[1, 1, 0, 1], holes=true, shadow=5.5, $fn=small_hole_segments, h=8);
            }
        }
        //smooth rod caps
        translate([-22, -10, 0]) cube([17, 2, 15]);
        translate([-22, -10, 45]) cube([17, 2, 10]);
    }
}

module x_end_base(vfillet=[3, 3, 3, 3], thru=true, len=40, offset=0){

    difference(){
        union(){
            translate([-10 - bushing_xy[0], -10 + len / 2 + offset, 30]) cube_fillet([x_box_width, len, x_box_height], center=true, vertical=vfillet, top=[5, 3, 5, 3]);

            translate([0, 0, 4 - bushing_xy[0]]) {
                //rotate([0, 0, 0]) translate([0, -9.5, 0]) 
                translate([z_delta, 0, 0]) render(convexity = 5) linear(bushing_z, bearing_height);
                // Nut trap
                translate([-2, 18, 5]) cube_fillet([20, 14, 10], center = true, vertical=[8, 0, 0, 5]);
                //}
            }
        }
        // here are bushings/bearings
        translate([z_delta, 0, 4 - bushing_xy[0]]) linear_negative(bushing_z, bearing_height);

        // belt hole
        translate([-14 - xy_delta / 2, 22 - 9 + offset, 30]) cube_fillet([max(idler_width + 2, 11), 55, 27], center = true, vertical=0, top=[0, 1, 0, 1], bottom=[0, 1, 0, 1], $fn=4);

        //smooth rods
        translate([-10 - bushing_xy[0], offset, 0]) {
            if(thru == true){
                translate([0, -11, 6]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, 50);
                translate([0, -11, xaxis_rod_distance+6]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, 50);
            } else {
                translate([0, -7, 6]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, 50);
                translate([0, -7, xaxis_rod_distance+6]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, 50);
            }
        }
        translate([0, 0, 5 - bushing_xy[0]]) {  // m5 nut insert
            translate([0, 17, 0]) rotate([0, 0, 10]){
                //rod
                translate([0, 0, -1]) cylinder(h=(4.1 / 2 + 5), r=3, $fn=32);
                //nut
                translate([0, 0, 9]) cylinder(r=4.6, h=14.1, center = true, $fn=6);

            }
        }
    }
    //threaded rod
    translate([0, 17, -10]) %cylinder(h = 150, r=2.5+0.2);
}


module pushfit_rod(diameter, length){
    cylinder(h = length, r=diameter/2, $fn=30);
    translate([0, -diameter/4, length/2]) cube_fillet([diameter, diameter/2, length], vertical = [0, 0, 1, 1], center = true, $fn=4);

    translate([0, -diameter/2-1.2, length/2]) cube([diameter - 1, 1, length], center = true);
}



module mount() {
    difference() {
        union() {
            import("EndStopMount_fixed.stl", convexity=10);
            hull(){
                translate([-35.5,-80,0])           
                    cube(size=[4, 3, 12]);
                translate([-31,-114,0])
                    cylinder(r=5, h=7);
            }           
        }
        
        translate([-30.5,-98,12])
            rotate([0, 90, 0])             
                cylinder(r=2.2, h=15, center=true, $fn=30);
                
        translate([-31,-114,12])            
                cylinder(r=1.25, h=30, center=true, $fn=100);
            
    }
}

module switchMount(){
    difference(){
        hull() {
            translate([20, 13, -3]) 
                rotate([0, 90, 0])
                    cylinder(r=3, h=7);
            translate([20, 23, -3]) 
                rotate([0, 90, 0])
                    cylinder(r=3, h=7);
            translate([20, 13, 50]) 
                rotate([0, 90, 0])
                    cylinder(r=3, h=7);
            translate([20, 23, 50]) 
                rotate([0, 90, 0])
                    cylinder(r=3, h=7);       
        }
        
        translate([0, 18.5, 14.8])
            rotate([0, 90, 0])
                cylinder(r=1.5, h=40, $fn=6);
        translate([0, 18.5, 45.6])
            rotate([0, 90, 0])
                cylinder(r=1.5, h=40, $fn=6);
        translate([25.5,23.5,-3])
            rotate([0, 90, 0])             
                cylinder(r=1.2, h=15, center=true, $fn=30);
        translate([25.5,13.5,-3])
            rotate([0, 90, 0])             
                cylinder(r=1.2, h=15, center=true, $fn=30);

    }    
}



// translate([-22,12,0])
//     rotate([0,0,180])
//         translate([-25.8,-0.3,0])
            
// translate([7.5,10.3,49.2])
//     difference(){
//         cube(size=[16.74, 8.5, 10.8]);
//         translate([0, 0, 6]) 
//             rotate([0, 45, 0])
//                 cube(size=[8, 30, 40], center=true);    
//         translate([19.5, 0, 0]) 
//             rotate([0, 48, 0])
//                 cube(size=[8, 30, 40], center=true);    
//     }
            

// Screw mount
// translate([-84,43,-35])
//     rotate([0,0,90])
//         mount();


// // Switch mount
difference(){
    switchMount();    
    translate([-50, 0, 0]) mirror([1, 0, 0]) translate([-50, 0, 0])
    x_end_motor();

 }
// // Switch and screw
// translate([30,18.5,0])
//     rotate([180,0,0])
//         %Switch();

// //screw
// translate([30,12,-23])        
//     %cylinder(r=1.25, h=30, center=true, $fn=100);