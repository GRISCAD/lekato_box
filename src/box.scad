include <config.scad>
include <GRISCAD/vectors.scad>

/*
 * Delta in to the <x,y> plane.
 */
function DELTA_XY(x) = [x, x, 0];
function DELTA_YZ(x) = [0, x, x];
function DELTA_XYZ(x) = [x, x, x];

TOP_GAPH=WALLW/2;

INNER_BOTTOM=[BACKBOX_IW, BACKBOX_ID, BACKBOX_IH];

module eraser_box(epsilon) {
    translate(-epsilon/2) {
        cube(epsilon + OUTER_BOTTOM);
    }
}

function DIM(nwalls) = INNER_BOTTOM + 2 * nwalls * DELTA_XY(WALLW) + 2 * (nwalls - 1) * DELTA_Z(WALLW);

module bottom(nwalls, epsilon = 0.01) {
    ODIM = DIM(nwalls);
    IDIM = DIM(nwalls-1);
    echo("nwalls = ", nwalls, "ODIM = ", ODIM, "IDIM = ", IDIM);
    difference() {
        translate((2 - nwalls) * DELTA_XYZ(WALLW)) {
            cube(ODIM);
        }
        translate((2 - nwalls + 1) * DELTA_XYZ(WALLW)) {
            cube(IDIM);
        }
    }
}

module lekato_bottom_left() {
    union() {
        // outer
        difference() {
            bottom(2);
            translate([BACKBOX_IW/2-YXGAP/2, -5, -5]) {
                cube(400);
            }
        }
        // inner
        difference() {
            bottom(1);
            translate([BACKBOX_IW/2+YXGAP/2, -5, -5]) {
                cube(400);
            }
        }
    }
}
