$fn=128;
module shell(){
difference() {
cylinder(h=50,r1=20,r2=15);
translate([0,0,-1])
cylinder(h=47,r1=18,r2=13);
}
}

module anschluss() {
    translate([0,0,48])
cylinder(h=10,r=4);
}

difference(){
union() {
shell();
anschluss();
}
translate([0,0,40])
    cylinder(h=25,r=3);
}
