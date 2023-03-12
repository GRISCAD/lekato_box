include <GRISCAD/assemblies.scad>
include <box.scad>

assembly(debug=false,
         normal=[1, 0, 0],
         offset=110) {
    lekato_bottom_right();
    lekato_bottom();
}
