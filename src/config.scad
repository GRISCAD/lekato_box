include <GRISCAD/units.scad>
include <GRISCAD/vectors.scad>

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
 * Dimensions of the interior of the front compartment.
 * This is small for holding a tablet stylus. A box of
 * this size will be centered in the front.
 */
FRONTBOX_IW=CM(15);
FRONTBOX_ID=CM(1.5);
FRONTBOX_IH=CM(1.5);

/*
 * The width of the wall.
 */
WALLW=5;

/*
 * The lid is 15% of the entire box.
 */
LID_OH=CM(1.5);

/*
 * The overlap is 10% of the entire box.
 * This number must be greater than LID_FRAC.
 */
OVERLAP_H=CM(1.0);

/*
 * Everything else is derived from the numbers above.
 *
 *   BOX_OW is the back box width plus two walls.
 *   BOX_OD is the sum of the front and back box depth plus
 *          three walls. One wall is the separation between
 *          the back and front.
 *   BOX_OH is the size of the bottom (BACKBOX_IH) plus
 *          the size of the lid (LID_OH) minus one overlap.
 */
BOX_OW=BACKBOX_IW+2*WALLW;
BOX_OD=BACKBOX_ID+FRONTBOX_ID+3*WALLW;
BOX_OH=BACKBOX_IH+LID_OH+2*WALLW - OVERLAP_H + 2*WALLW;

BOTTOM_OW=BOX_OW;
BOTTOM_OD=BOX_OD;
BOTTOM_OH=BACKBOX_IH+WALLW;

LID_OW=BOX_OW;
LID_OD=BOX_OD;
/* LID_OH is already defined. */

/*
 * The box will be rendered with the front left bottom
 * corner at the origin, facing the negative Y axis, with
 * the Z axis up. So, it's entirely in the positive octant.
 */
/*
 * Where to translate the front box.
 */
FRONT_BOX_OFFSET_X=(BOTTOM_OW - FRONTBOX_IW)/2;
FRONT_BOX_OFFSET_Y=1.3*WALLW;
FRONT_BOX_OFFSET_Z=BOTTOM_OH-FRONTBOX_IH;

/*
 * Where to translate the back box.
 */
BACK_BOX_OFFSET_X=WALLW;
BACK_BOX_OFFSET_Y=WALLW + FRONTBOX_ID + WALLW;
BACK_BOX_OFFSET_Z=WALLW;

BAND_W=IN(1.0);
