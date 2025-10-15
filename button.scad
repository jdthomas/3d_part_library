use <./button-part.scad>

module button_holes(cut_depth = 2) {
    cylinder(h=10, r=4, center=true);
}

module button() {
  translate([5,-5,0])
  solid_object();
}