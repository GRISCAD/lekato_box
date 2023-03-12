include <config.scad>
include <GRISCAD/units.scad>

module overlap_interior(tolerance = 0.0,
                        epsilon   = 0.0) {
    translate([WALLW/2+tolerance/2,
               WALLW/2+tolerance/2,
               -epsilon]) {
        cube([BOX_OW-WALLW-tolerance,
              BOX_OD-WALLW-tolerance,
              OVERLAP_H + 2*epsilon + tolerance]);
    }
}

module overlap_exterior(tolerance = 0.0,
                        epsilon   = 0.0) {
    difference() {
        cube([BOX_OW, BOX_OD, OVERLAP_H]);
        overlap_interior(tolerance=-tolerance,
                         epsilon=epsilon);
    }
}

module lekato_bottom() {
    difference() {
        cube([BOTTOM_OW, BOTTOM_OD, BOTTOM_OH]);
        /* Subtract off the overlap. */
        translate([0, 0, BOTTOM_OH-OVERLAP_H]) {
            difference() {
                translate([-EPSILON, -EPSILON, 0]) {
                    cube([BOTTOM_OW+2*EPSILON,
                          BOTTOM_OD+2*EPSILON,
                          OVERLAP_H+EPSILON]);
                }
                translate([WALLW/2-TOLERANCE,
                           WALLW/2-TOLERANCE,
                           -2*EPSILON]) {
                    cube([BOTTOM_OW-WALLW+2*TOLERANCE,
                          BOTTOM_OD-WALLW+2*TOLERANCE,
                          OVERLAP_H+4*EPSILON]);
                }
            }
        }
        translate([BOX_OFFSET_X,
                   BOX_OFFSET_Y,
                   BOX_OFFSET_Z]) {
          cube([BOX_IW, BOX_ID, BOX_IH] + [0, 0, EPSILON]);
        }
    }
}

HALF_SPACE_SIZE=400;

function DELTA3D(t) = ([t, t, t]);

module negative_X_half_space() {
    translate([-HALF_SPACE_SIZE, 
               -HALF_SPACE_SIZE/2, 
               -HALF_SPACE_SIZE/2]) {
        cube(DELTA3D(HALF_SPACE_SIZE));
    }
}

module positive_X_half_space() {
    translate([0, 
               -HALF_SPACE_SIZE/2,  
               -HALF_SPACE_SIZE/2]) {
        cube(DELTA3D(HALF_SPACE_SIZE));
     }
}               

module lekato_bottom_band(epsilon = 0.0) {
    difference() {
        translate([(BOTTOM_OW-BAND_W)/2-epsilon/2,
                   -epsilon,
                   -epsilon]) {
            cube([BAND_W+epsilon,
                  BOTTOM_OD+2*epsilon,
                  BOTTOM_OH-OVERLAP_H + 2*epsilon]);
        }
        translate([(BOTTOM_OW-BAND_W)/2-EPSILON,
                   WALLW/2,
                   WALLW/2]) {
            cube([BAND_W+2*EPSILON,
                  BOTTOM_OD-WALLW,
                  BOTTOM_OH+WALLW]);
        }
    }
}

module lekato_bottom_left() {
    union() {
        difference() {
            difference() {
                lekato_bottom();
                lekato_bottom_band(epsilon=EPSILON);
            }
            translate([BOX_OW/2, 0, 0]) {
                positive_X_half_space();
            }
        }
        lekato_bottom_band(epsilon=0);
    }
}

module lekato_bottom_right() {
    translate([-BOX_OW/2, 0, 0]) {
        difference() {
            difference() {
                lekato_bottom();
                lekato_bottom_band(epsilon=EPSILON);
            }
            translate([BOX_OW/2, 0, 0]) {
                negative_X_half_space();
            }
        }
    }
}

module lekato_top() {
    difference() {
        cube([BOX_OW, BOX_OD, LID_OH]);
        translate([0, 0, (LID_OH-OVERLAP_H) - EPSILON]) {
            overlap_interior(tolerance=TOLERANCE,
                             epsilon=EPSILON);
        }
    }
}

module lekato_top_band(epsilon = 0.0, tolerance=0.0) {
    difference() {
        translate([(LID_OW-BAND_W)/2-epsilon/2,
                   -epsilon,
                   -epsilon]) {
            cube([BAND_W+epsilon,
                  LID_OD + 2*epsilon,
                  LID_OH + 2*epsilon]);
        }
        translate([(LID_OW-BAND_W)/2-epsilon,
                   WALLW/4-epsilon/2,
                   WALLW/4]) {
            cube([BAND_W+2*epsilon,
                  LID_OD - WALLW/2 + epsilon + tolerance,
                  LID_OH+WALLW/2]);
        }
    }
}

module lekato_top_left() {
    union() {
        difference() {
            difference() {
                lekato_top();
                lekato_top_band(epsilon=EPSILON, tolerance=TOLERANCE);
            }
            translate([BOX_OW/2, 0, 0]) {
                positive_X_half_space();
            }
        }
        lekato_top_band(epsilon=EPSILON, tolerance=TOLERANCE);
    }
}

module lekato_top_right() {
    translate([-BOX_OW/2, 0, 0]) {
        difference() {
            difference() {
                lekato_top();
                lekato_top_band(epsilon=EPSILON);
            }
            translate([BOX_OW/2, 0, 0]) {
                negative_X_half_space();
            }
        }
    }
}
