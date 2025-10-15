
module mounting_post(height, screw_size = 2.0, embed = 1.0) {
  fudge = height / 20; // posts get wider as they get taller for strength
  T = [ 0, 0, -(height + embed)/2 ];
  // echo("embed",embed, "height", height, "ss", screw_size, "fudge", fudge, "t", T);

  translate(T)
  difference() {
    // post
    cylinder(h = height + embed, r = screw_size + fudge, center = true);
    // screw hole
    cylinder(h = height + 1 + embed, r = screw_size / 2, center = true);
  }
}