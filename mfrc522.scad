
use <./mounting_post.scad>
use <./mfrc522-part.scad>

module mfrc522_mounting_posts(height, embed=1) {
  min_height = 1.0;

  translate([-17, 0, -28.5])
    rotate([90, 0, 0]) {
      translate([0, 43, 0]) rotate([180,0,0]) mounting_post(height + min_height, embed=embed);
      translate([34, 43, 0]) rotate([180,0,0]) mounting_post(height + min_height, embed=embed);

      translate([4, 6, 0]) rotate([180,0,0]) mounting_post(height + min_height, embed=embed);
      translate([29, 6, 0]) rotate([180,0,0]) mounting_post(height + min_height, embed=embed);
    }
}

module mfrc522_holes(cut_depth = 2) {
  // no holes needed
}

module mfrc522() {
  solid_object();
}