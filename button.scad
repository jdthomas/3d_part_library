
module button_holes(cut_depth = 2) {
    cylinder(h=10, r=4, center=true);
}
// https://grabcad.com/library/momentary-button-switch-spst-m6-1
use <./button-part.scad>

module button() {
  translate([5,-5,0])
  solid_object();
}