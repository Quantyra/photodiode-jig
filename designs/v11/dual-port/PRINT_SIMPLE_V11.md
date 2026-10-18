# V11 simple dual-port photodiode holder

Three printed parts: holder, front shutter and rear drawer. This retains the V5-style fixed holder and V6 four-state shutter. Only the body bores change, from 3.45 to 3.60 mm (+0.075 mm radial clearance). The bore size is provisional, not a measured diode diameter or production tolerance. The presumed diode is uxcell 3 mm flat-head, ASIN B07VNSX74J; its actual dimensions remain unknown.

## Files and reuse

Use `dual_photodiode_jig_v11.scad` and these three files in `exports/v11-simple/`:

- `dual_photodiode_jig_v11.stl` — print the revised holder.
- `dual_photodiode_front_shutter_v11.stl` — identical bytes to the accepted V6 shutter. Reuse an existing V6 front shutter; replace a V5 front shutter to obtain the right-only state.
- `dual_photodiode_rear_drawer_v11.stl` — identical bytes to the V6/V5 rear drawer; reuse that drawer.

No coupons are required or exported for V11. Historical optional coupon modules remain in the source. No extra mechanisms or parts are required. Pocket depth remains nominally 4.8 mm; flange recess D5.5 x 1.2 mm, apertures D2, port pitch 10 mm, rails, stops and lead routes are unchanged.

## Printing and assembly

Import the STLs in millimetres at 100% scale. Preserve the supplied orientation: the holder prints on its x-end/side, 44 mm tall, and both panels print flat with grip/engraving or retaining lands up. The holder's print-bed footprint is 18.8 x 30 mm. This differs from its upright bench orientation.

Prior guidance is PETG, Normal 0.20 mm, supports off, and a 5 mm outer brim on the holder, subject to layer preview and the actual machine/material profile. No new slicer validation or G-code is supplied. Check rails, lead exits, bridges and bed contact in preview; do not resize the model to adjust fit.

Load the diodes from the rear, route the leads through the existing grooves and exits, and slide the rear drawer from the -x/loading side until seated. The front shutter uses the front rails and the same loading side. Check body fit without forcing the diode. Dan reports that both single-port and dual-port V11 versions have been printed and that the photodiodes he uses fit perfectly in the dual-port V11. This user-reported fit observation applies only to his photodiodes in this dual-port version; it does not establish fit for other diode models. He has not separately reported single-port diode fit, measured package dimensions, light-exclusion results, friction/repeatability or manufacturing yield.

## Four marked positions

View from the front/light-entry face with lead exits down: +x is right, +y is up and +z points toward the viewer/light source. Left port is x=-5; right port is x=+5. Align the chosen engraved tick with the same upper holder rail loading edge at x=-22.

| State | Tick | Offset from both-open |
| --- | --- | ---: |
| Left only | L | -10 mm |
| Both open | 2 | 0 mm |
| Both blocked | 0 | +5 mm |
| Right only, insertion stop | R | +10 mm |

From the insertion stop, pull back 5 mm for blocked, 10 mm for both open, or 20 mm for left only. Intermediate positions are marks, not detents. Panels remain intentionally removable. The shutter is 56 x 26 x 4 mm overall, including its 5 mm loading-end extension; the main plate is 2 mm thick.

## Size and clearance

Dimensions below are nominal CAD bounds in millimetres, excluding wires, diodes, hand clearance and panel removal travel. Assembly axes use x width, y height, z optical depth.

| Item/state | x width | y height | z depth |
| --- | ---: | ---: | ---: |
| Core body | 44 | 30 | 8 |
| Holder including front/rear rails | 44 | 30 | 18.8 |
| Rear drawer alone | 49 | 26 | 5.2 |
| Front shutter alone | 56 | 26 | 4 |
| Left-only assembly | 66 | 30 | 18.8 |
| Both-open assembly | 56 | 30 | 18.8 |
| Closed/both-blocked assembly | 56 | 30 | 18.8 |
| Right-only assembly | 60 | 30 | 18.8 |
| Full operating sweep, -10 to +10 | 76 | 30 | 18.8 |

With lead exits down on the bench, the holder envelope is 44 mm wide x 18.8 mm deep x 30 mm high. The closed assembly is 56 x 18.8 mm in plan; reserve at least the 76 x 18.8 mm operating envelope plus wire and finger clearance. This is an envelope, not a tested stability or support-footprint claim. Exported print axes are different: holder X/Y/Z = 18.8/30/44 mm; panels remain 56/26/4 and 49/26/5.2 mm.
