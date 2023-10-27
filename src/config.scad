include <GRISCAD/units.scad>

/*
 * These do not have units, they are ratios.
 */
EPSILON=0.03;
TOLERANCE=0.2;

/*
 * Dimensions of the interior of the back compartment
 * of the box. This is the size of the foam insert in the
 * original cardboard box. The charging cord fits into the
 * foam insert, so there is no compartment for it in this
 * box design.
 */
BACKBOX_IW=CM(22);
BACKBOX_ID=CM(13.5);
BACKBOX_IH=CM(4.5);

/*
 * This is the gap for the two halves.
 */
YZGAP=CM(1.0);
/*
 * This is the gap for the lid.
 */
YXGAP=CM(1.0);
/*
 * The width of the wall.
 */
WALLW=MM(2.5);
