use <./mounting_post.scad>
use <./esp32-rev-part.scad>
use <./pin_headers.scad>


module esp_rev_mounting_posts(height, embed=1) {
  min_height = 2.0;

  translate([2.5, 2.5, 0]) mounting_post(height + min_height, embed=embed);
  translate([2.5, 20.5, 0]) mounting_post(height + min_height, embed=embed);

  translate([48.2, 2, 0]) mounting_post(height + min_height, embed=embed);
  translate([48.2, 21, 0]) mounting_post(height + min_height , embed=embed);
}

module esp_rev_holes(cut_depth = 2) {

  module usb_c_hole(cut_depth) {
    W = 3;
    L = 8.4;
    coordinates = [
      [0, 0, 0],
      [0, L, 0],
      [W, L, 0],
      [W, 0, 0],
      [0, 0, cut_depth + 4],
      [0, L, cut_depth + 4],
      [W, 0, cut_depth + 4],
      [W, L, cut_depth + 4],
    ];
    echo("jeff", coordinates);
    translate([0, 0, -(cut_depth + 4) / 2])
      // cube([4, 9.4, cut_depth + 4]);
      hull()for (i = coordinates)
        translate(i) sphere(1);
  }
  WINDOW_W = 28;
  WINDOW_L = 18;
  SCREEN_OFFSET_FOR_REVERSE_FEATHER = 11;
  //   SCREEN_OFFSET_FOR_FORWARD_FEATHER = 15;

  module screen_hole(cut_depth) {
    translate([0, 0, -(cut_depth + 4) / 2])
      cube([WINDOW_L, WINDOW_W, cut_depth + 4]);
  }

  translate([WINDOW_W + SCREEN_OFFSET_FOR_REVERSE_FEATHER + 2, 0 + 2.4, 0])
    rotate([0, 0, 90])
      screen_hole(cut_depth);

  translate([0, 7.2, 4.5])
    rotate([0, 90, 0])
      usb_c_hole(cut_depth);

  // dig a small trench/slot for on board buttons next to screen
  translate([6,2.5,-2])
  cube([ 3, 18, 2 ]);

}

module esp_rev_pins(
  angle = 0,
) {

    translate([2.54*2,1.4,1.6])
    pin_header(16, angle=angle+180);

    translate([2.54*6,23-1.4,1.6])
    pin_header(12, angle=angle);
}

module esp_rev() {
  solid_object();
}
