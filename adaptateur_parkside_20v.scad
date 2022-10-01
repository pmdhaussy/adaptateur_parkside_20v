$fn=100;

color("grey") {
    difference() {
        union() {
            cube([34, 24, 3]);
            translate([2, 0, 3])
                cube([30, 24, 2.5]);
            translate([2, 8, 5.5]) {
                cube([30, 2, 9]);

                translate([3.7, 0, 0])
                    rotate([90, 0, 0])
                        pyramid(7.5, 10.5, 10.5);

                 translate([12.7, 0, 0]) {
                    rotate([90, 0, 0])
                        //difference() {
                            pyramid(7.5, 9.5, 9.5);
                            // cube([7.6, 20, 8]);
                        //}
                 }
            }
        }
        cosses();
        translate([0, 3.8, -1]) {
            translate([6.8, 0, 0]) {
                cylinder(6.6, 3, 3);
                translate([1.75, 1.25, 11]) rotate([90, 0, -225]) cylinder(10, 2.5, 2.5);
            }
            //translate([20, 0, 0]) cylinder(6.6, 3, 3);
            translate([26.8, 0, 0]) {
                cylinder(6.6, 3, 3);
                translate([-1.5, 1.2, 11]) rotate([90, 0, 225]) cylinder(10, 2.5, 2.5);
            }
        }
    }
}
//cosses();

module cosses()  {
    translate([4.5, 8, 6])
        cosse45(RIGHT);
//    translate([21, 8, 6])
//        cosse45();
    translate([28.5, 8, 6])
        cosse45();
}

LEFT=0;
RIGHT=1;
module cosse45(orientation=LEFT) {
    thickness=0.8;
    lenght1=8.5;
    lenght2=10;
    width=8;
    cube([thickness, lenght1, width]);
    if (orientation==LEFT) {
        bent_part(thickness, 0, 0, 0, 0, 180-45);
    } else {
        bent_part(2/3*thickness, 2/3*thickness, 0, 0, 0, 270-45);
    }

    module bent_part(tx, ty, tz, rx, ry, rz) {        
        translate([tx, ty, tz])
            rotate([rx, ry, rz])
                difference() {
                    cube([thickness, lenght2, width]);
                    translate([0, lenght2/2, width/2])
                        rotate([0, 90, 0])
                            cylinder(5, 2.5, 2.5, center=true);
                }
    }
}


module pyramid(dx, dy, dz) {
    ndy = sqrt(pow(dy, 2)+pow(dz, 2));
    // pyramid
    rotate([135, 0, 90])
    difference() {
        cube([dx, dy, dz]);
        rotate([45, 0, 0])
            translate([-1, 0, 0])
                cube([dx+2, ndy+1, dz]);
    }
}
