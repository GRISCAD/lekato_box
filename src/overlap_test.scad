include <box.scad>
include <GRISCAD/assemblies.scad>

assembly(debug=false,
         normal=[1, 0, 0],
         offset=30) {
    translate([0, 0, 0]) {
        overlap_interior(tolerance=TOLERANCE/2.0,
                         epsilon=0.0);
    }
    translate([0, 0, 0]) {
        overlap_exterior(tolerance=TOLERANCE,
                         epsilon=EPSILON);
    }
}
