// Standard 2.54mm (0.1") pitch male pin headers
// Supports straight and angled configurations
// Single row only

// Standard dimensions based on common specifications:
// - Pitch: 2.54mm between pins
// - Pin size: 0.64mm × 0.64mm (square)
// - Plastic body height: 2.0mm
// - Pin length above plastic: 6mm (for straight headers, angle=0)
// - Pin length below plastic: 3mm (insertion length)

module pin_header(
  num_pins = 1,
  angle = 0,                 // 0=straight, 90=right-angle (+Y), 270=right-angle (-Y)
  pin_length_above = 6,      // length of pin above plastic body (or horizontal length for angled)
  pin_length_below = 2       // length of pin below plastic body (insertion)
) {

  // Pin and body dimensions
  pitch = 2.54;
  pin_size = 0.64;
  body_height = 2.0;         // reduced from 2.5mm

  // Angled header dimensions
  bend_height = pitch/2;

  if (angle == 0 || angle == 180) {
    // Straight pin header
    union() {
      // Plastic body
      color("Black")
        translate([0, -pitch/2, 0])
          cube([num_pins * pitch, pitch, body_height]);

      // Pins
      color("Silver")
        for (i = [0:num_pins-1]) {
          translate([i * pitch + pitch/2, 0, 0]) {
            translate([0, 0, body_height/2 + pin_length_above/2 - pin_length_below])
              cube([pin_size, pin_size, pin_length_below + pin_length_above], center=true);
          }
        }
    }
  } else if (angle == 90 || angle == 270) {
    // Right-angle pin header
    direction = (angle == 90) ? 1 : -1;  // +Y for 90, -Y for 270

    union() {
      // Plastic body
      color("Black") {
        translate([0, -pitch/2 + direction * pitch/2, bend_height - body_height/2 ])
           cube([num_pins * pitch, pitch, body_height]);
      }

      // Pins
      color("Silver")
        for (i = [0:num_pins-1]) {
          translate([i * pitch + pitch/2, 0, 0]) {
            // Vertical pin
            translate([0, 0, bend_height - pin_length_below + pin_size/2])
              cube([pin_size, pin_size, pin_length_below + bend_height], center=true);

            // Horizontal mating pin
            translate([0, direction * pitch, bend_height])
              cube([pin_size, pin_length_above, pin_size], center=true);
          }
        }
    }
  }
}

// Example usage (uncomment to test):
// Straight header with 8 pins
// pin_header(num_pins=8, angle=0);

// Right-angle header with 8 pins (90 degrees, bends towards +Y)
// translate([0, 20, 0])
//   pin_header(num_pins=8, angle=90);

// Right-angle header with 8 pins (270 degrees, bends towards -Y)
// translate([0, 40, 0])
//   pin_header(num_pins=8, angle=270);
