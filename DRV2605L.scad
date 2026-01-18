
use <./mounting_post.scad>
use <./pin_headers.scad>

module drv2605l_mounting_posts(height, embed=1) {

}

module drv2605l_holes(cut_depth = 2) {
}

module ddrv2605l_pins(
  angle = 0,
  include_cable = false,
) {
}

use <./DRV2605L-part.scad>

module drv2605l() {
    translate([-9,-8,0])
    solid_object();
}
