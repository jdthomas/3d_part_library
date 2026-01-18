
use <./mounting_post.scad>
use <./pin_headers.scad>

module hc_sr04_mounting_posts(height, embed=1) {

}

module hc_sr04_holes(cut_depth = 2) {
}

module hc_sr04_pins(
  angle = 0,
  include_cable = false,
) {
}

use <./hc-sr04-part.scad>

module hc_sr04() {
    rotate([180,0,0])
    solid_object();
}
