
use <./mounting_post.scad>

module sds011_mounting_posts(height, embed=1) {
  min_height = 2.0;

  translate([-30, -31, 0]) {
    translate([(22.5 - 3.5), 0, 0]) mounting_post(height + min_height, screw_size=3, embed=embed);
    translate([0, (57.5 - 2.5), 0]) mounting_post(height + min_height, screw_size=3, embed=embed);
    translate([60, (57.5 - 2.5), 0]) mounting_post(height + min_height, screw_size=3, embed=embed);
  }
}

module sds011_holes(cut_depth = 2) {
  translate([-15, 40, 7])
    rotate([90, 0, 0])
      cylinder(h=cut_depth + 10, r=4);
}

// https://grabcad.com/library/nova-pmsensor-sds011-1
use <./sds011-part.scad>

module sds011() {
  solid_object();
}