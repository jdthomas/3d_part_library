
use <./mounting_post.scad>
use <./pin_headers.scad>

module ky040_mounting_posts(height, embed=1) {
    min_height = 1.0;
    translate([-8.5,-7.4,0]) {
        translate([ 0, 0, 0 ]) mounting_post(height + min_height, embed=embed);
        translate([ 0 + 14, 0, 0 ]) mounting_post(height + min_height, embed=embed);
    }
}

module ky040_holes(cut_depth = 2) {
    translate([ -2.8, 1.3,5+2])
    cylinder(h = 10, r = 4, center = true);
}

module ky040_pins(
  angle = 0,
  include_cable = false,
) {
}

// https://grabcad.com/library/rotary-encoder-ky-040-1
use <./ky-040-part.scad>

module ky040() {
  rotate([90,0,90])
  solid_object();
}
