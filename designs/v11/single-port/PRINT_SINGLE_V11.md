# Single-port fixed V11 — print and use

Print **one of each** from `exports/v11-simple-single/`:

| File | Quantity | Supplied print X/Y/Z bounds (mm) |
| --- | --- | --- |
| `single_photodiode_jig_v11.stl` | 1 | 18.8 / 30 / 34 |
| `single_photodiode_front_shutter_v11.stl` | 1 | 42 / 26 / 4 |
| `single_photodiode_rear_drawer_v11.stl` | 1 | 39 / 26 / 5.2 |

All three parts are new. Dual V11 panels are not compatible replacements for this narrower assembly. Editable, self-contained source: `single_photodiode_jig_v11.scad`. No additional printed part, fastener, iris, sleeve or detent is required. No G-code is supplied.

Use the STL orientations: holder on its side, drawers flat. Black PETG, Normal 0.20 mm, supports off and a 5 mm outer holder brim are inherited starting guidance, **not a new slicer validation**. Inspect the actual Ender/0.4 mm nozzle profile and layer preview before printing. Confirm the 3 mm O/C engravings, thin 0.6 mm rear end wall, rail bridges, 45-degree rear gussets and two lead exits survive slicing. The 0.34 mm divider between exits is thinner than the nozzle and may disappear; it is not a retaining/load-bearing feature. If omitted, the combined local bridge can approach 4.74 mm. Pocket roof spans reach 5.5 mm; terminal rear bridges are conservatively at most 4.8 mm. Dan reports that both single-port and dual-port V11 versions have been printed. He has not separately reported single-port diode fit. His report that the photodiodes he uses fit perfectly applies only to the dual-port V11 and does not establish single-port fit or fit for other diode models. He has not reported measured package dimensions, light-exclusion results, friction/repeatability or manufacturing yield.

From the light-entry FRONT, +x is right, +y is up, and +z is toward the light/viewer. Lead exits point down (-y). Insert both drawers from the LEFT (-x) and slide right. Load the representative diode from the rear into the stepped pocket, orient its flat side toward +y and route two leads separately toward -y through the grooves/exits. Do not force an unmeasured package or strain its leads. Close the rear drawer to its stop at x offset 0; its raised lands face the diode. Slide the front drawer until the selected tick aligns with the same upper holder rail loading edge (x=-17 mm):

- **O = OPEN:** offset 0 mm; window centered over the fixed aperture at x=0, y=3.
- **C = CLOSED:** offset +5 mm; the insertion stop meets the holder. The moving window is now to the right of the fixed aperture.

There are exactly two engraved state markings, O/C with their ticks. OPEN has no detent; align it manually. Withdraw either drawer toward -x for intentional removal. Restrain the diode before withdrawing the rear drawer: there is no withdrawal latch, clamping or preload. Nominal axial float to the lands is 0.6 mm (0.2–1.0 mm over rear vertical play); this is a retention limit, not holding-force validation.

| Assembly envelope, excluding leads/hands/removal | X/Y/Z (mm) | X range (mm) |
| --- | --- | --- |
| Bare holder, including rails | 34 / 30 / 18.8 | -17..17 |
| OPEN | 42 / 30 / 18.8 | -25..17 |
| CLOSED | 45 / 30 / 18.8 | -23..22 |
| Complete OPEN–CLOSED operating sweep | 47 / 30 / 18.8 | -25..22 |

On a flat bench the support plane is y=-15; no printed piece projects below it. Body core: 34 x 30 x 8 mm. Rail-to-rail depth: z=-6.4..12.4. Representative package assumptions: body D3.0, flange up to D5.0 x 1.2 with flat side, two D0.6 leads at 2.54 mm pitch, 0.8 mm bend radius. Pockets remain provisional D3.60, flange D5.5 x 1.2, nominal depth 4.8 (actual bore roof z=4.79 from the inherited cutter), aperture D2.

The two 2.2 mm-wide lead exits extend to z=-2.5 to clear bent leads before flange-to-land contact. Seams and exits remain openings. CAD checks do not establish measured package fit, opacity/light-tightness, holding force, sliding friction, tilt resistance, bench stability, printing reliability or production readiness. Inspect and physically fit-test before use; no physical acceptance is claimed.
