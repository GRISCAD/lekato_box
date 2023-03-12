include <GRISCAD/units.scad>


EPSILON=1.0;
TOLERANCE=0.2;

/*
 * Dimensions of the interior of the back compartment
 * of the box. This is the size of the foam insert in the
 * original cardboard box. The charging cord fits into the
 * foam insert, so there is no compartment for it in this
 * box design.
 */
BOX_IW=CM(22);
BOX_ID=CM(13.5);
BOX_IH=CM(4.5);

/*
 * The width of the wall.
 */
WALLW=5;

/*
 * The lid is 1.5cm. But the overlap takes
 * some of this.
 */
LID_OH=CM(1.5);

/*
 * The overlap is 1.0cm high. This number must be
 * greater than LID_OH.
 */
OVERLAP_H=CM(1.0);

/*
 * Everything else is derived from the numbers above.
 *
 *   BOX_OW is the back box width plus two walls.
 *   BOX_OD is the sum interior box depth plus
 *          two walls.
 *   BOX_OH is the size of the bottom (BOX_IH) plus
 *          the size of the lid (LID_OH) minus one overlap.
 */
BOX_OW=BOX_IW + 2*WALLW;
BOX_OD=BOX_ID + 2*WALLW;
BOX_OH=BOX_IH + LID_OH - OVERLAP_H + 2*WALLW;

BOTTOM_OW=BOX_OW;
BOTTOM_OD=BOX_OD;
BOTTOM_OH=BOX_IH+WALLW;

LID_OW=BOX_OW;
LID_OD=BOX_OD;
/* LID_OH is already defined. */

/*
 * Where to translate the inner box.
 */
BOX_OFFSET_X=WALLW;
BOX_OFFSET_Y=WALLW;
BOX_OFFSET_Z=WALLW;

BAND_W=INCH(1.0);
