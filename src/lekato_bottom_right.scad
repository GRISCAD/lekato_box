include <GRISCAD/assemblies.scad>
include <box.scad>

EXPLODED_OFFSET=20;
OFFSET_X=BOX_OW/2 + EXPLODED_OFFSET;
OFFSET_Z = BOX_OH + EXPLODED_OFFSET;
assembly(debug=false) {
    translate([offset_X, 0, 0]) {
        lekato_bottom_right();
    }
    lekato_bottom_left();
    translate([OFFSET_X, 0, OFFSET_Z]) {
        lekato_top_right();
    }
    translate([0, 0, OFFSET_Z]) {
        lekato_top_left();
    }
}
