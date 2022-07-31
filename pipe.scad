$fn=128;

radius = 3;
inner_radius = 2;

bend_radius = 2;

angle_1 = 0;
angle_2 = 90;

module halfpipe(){ 
union() {
  
        // bend
        difference() {
                // torus
                rotate_extrude()
                        translate([bend_radius + radius, 0, 0])
                        circle(r=radius);

                // torus cutout
                rotate_extrude()
                        translate([bend_radius + radius, 0, 0])
                        circle(r=inner_radius);
                // lower cutout
                rotate([0, 0, angle_1])
                        translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), -100, -50])
                        cube([100, 100, 100]);
                // upper cutout
                rotate([0, 0, angle_2])
                        translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), 0, -50])
                        cube([100, 100, 100]);
        }
}
}

module anschluss() {
    difference() {
    cylinder(h= 7, r= inner_radius,center = true);
    cylinder(h= 7.1, r= (inner_radius-1),center = true);
    }
}

union() {
halfpipe();
rotate([0,0,90]) halfpipe();


rotate([90,0,0])
translate([bend_radius + radius, 0, 2])
anschluss();
    
rotate([90,0,0])
translate([-(bend_radius + radius), 0, 2])
anschluss();

}