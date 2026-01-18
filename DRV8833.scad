
use <./mounting_post.scad>
use <./pin_headers.scad>

module drv8833_mounting_posts(height, embed=1) {

}

module drv8833_holes(cut_depth = 2) {
}

module drv8833_pins(
  angle = 0,
  include_cable = false,
) {
}

use <./DRV8833-part.scad>

module drv8833() {
    solid_object();
}
