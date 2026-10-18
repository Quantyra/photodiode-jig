# V11 G-code package (v11.1.2)

Six original V11 files, preserved byte-for-byte. [SHA256SUMS](SHA256SUMS) uses paths relative to this directory. STL mapping is by corresponding part basename, not geometric equivalence verification. No V5 files are included.

| Original G-code | Corresponding V11 STL | Bytes |
| --- | --- | ---: |
| [dual_photodiode_front_shutter_v11-Ender-3 V3 KE_0.4_CR-PETG_8m.gcode](dual/dual_photodiode_front_shutter_v11-Ender-3%20V3%20KE_0.4_CR-PETG_8m.gcode) | [dual_photodiode_front_shutter_v11.stl](../../designs/v11/dual-port/exports/v11-simple/dual_photodiode_front_shutter_v11.stl) | 321686 |
| [dual_photodiode_jig_v11-Ender-3 V3 KE_0.4_CR-PETG_37m.gcode](dual/dual_photodiode_jig_v11-Ender-3%20V3%20KE_0.4_CR-PETG_37m.gcode) | [dual_photodiode_jig_v11.stl](../../designs/v11/dual-port/exports/v11-simple/dual_photodiode_jig_v11.stl) | 2033384 |
| [dual_photodiode_rear_drawer_v11-Ender-3 V3 KE_0.4_CR-PETG_7m.gcode](dual/dual_photodiode_rear_drawer_v11-Ender-3%20V3%20KE_0.4_CR-PETG_7m.gcode) | [dual_photodiode_rear_drawer_v11.stl](../../designs/v11/dual-port/exports/v11-simple/dual_photodiode_rear_drawer_v11.stl) | 194834 |
| [single_photodiode_front_shutter_v11-Ender-3 V3 KE_0.4_CR-PETG_6m.gcode](single/single_photodiode_front_shutter_v11-Ender-3%20V3%20KE_0.4_CR-PETG_6m.gcode) | [single_photodiode_front_shutter_v11.stl](../../designs/v11/single-port/exports/v11-simple-single/single_photodiode_front_shutter_v11.stl) | 245980 |
| [single_photodiode_jig_v11-Ender-3 V3 KE_0.4_CR-PETG_28m.gcode](single/single_photodiode_jig_v11-Ender-3%20V3%20KE_0.4_CR-PETG_28m.gcode) | [single_photodiode_jig_v11.stl](../../designs/v11/single-port/exports/v11-simple-single/single_photodiode_jig_v11.stl) | 1533406 |
| [single_photodiode_rear_drawer_v11-Ender-3 V3 KE_0.4_CR-PETG_6m.gcode](single/single_photodiode_rear_drawer_v11-Ender-3%20V3%20KE_0.4_CR-PETG_6m.gcode) | [single_photodiode_rear_drawer_v11.stl](../../designs/v11/single-port/exports/v11-simple-single/single_photodiode_rear_drawer_v11.stl) | 172852 |

## Embedded settings and identity limits

All six files contain the following settings, extracted from comments and commands:

| Field | Embedded value |
| --- | --- |
| Slicer / engine | Creality Print V4.3.8.6674 / CXEngine; CRSLICE_GIT_HASH d90fa71 |
| Flavor | Marlin |
| Machine / build volume | F005 / X220 x Y220 x Z240 mm |
| Material | PETG; CR-PETG_1.75; diameter 1.75 mm |
| Hotend / bed | 230 / 80 degrees C; M104/M109 S230 and M190 S80 |
| Layer height | 0.2 mm; first deposition Z0.2; raw `Inital Height:200` |
| Nozzle | Raw `ExtruderParams[0] Nozzle Diameter:1000`; units/encoding unresolved |
| Extrusion widths | Outer wall 0.4 mm; inner wall 0.42 mm |
| Walls / infill | 2 walls; grid; 15% sparse density |
| Support / adhesion | Support Enable:false; brim |

Filenames identify Ender-3 V3 **KE**, 0.4 mm. Embedded `F005`, nozzle value `1000`, and `Screen Size:Sermoon D3` do not independently confirm that printer or nozzle. Do not interpret `1000` as a verified physical nozzle diameter. Historical Ender-3 V3 **SE** descriptions are separate provenance and do not establish SE compatibility for these KE-labelled files. Confirm actual machine, nozzle, firmware and profile; reslice the linked STL for other machines or incompatible settings.

## Static command review

Inspected as text only; never executed. No hardware test or general safety/validation claim is made.

All six wait for the bed at 80 C, set the hotend to 230 C, select absolute extrusion (`M82`), reset feed/flow overrides (`M220/M221 S100`), and home (`G28`). They move to Z2, then X-2 Y20 Z0.28 before waiting for hotend temperature and purging at X-2 and X-1.7 through Y145. Negative-X purge moves require actual clearance and firmware travel limits to be checked. No explicit `G90` precedes initial XYZ motion, so startup relies on firmware/homing state for absolute positioning. No explicit bed-mesh load/probe command is present; check homing/firmware mesh behavior.

`M900 K0.050000` requires compatible firmware linear-advance handling. `M204` changes acceleration. Travel reaches F18000 (300 mm/s); initial travel reaches Z20.101 before returning to printing height. Check firmware interpretation and motion limits in a slicer preview. No named startup macros occur; firmware implementation remains machine-dependent.

The end uses `G91`, retracts/raises Z, wipes X5 Y5, raises Z5, returns to `G90`, and presents at X2 Y218. It switches off fan/hotend/bed, disables X/Y/E steppers (`M84 X Y E`) and restores `M82`. Relative lifts near machine height limits and the Y218 move need clearance review. Original commands are preserved with these concerns, not corrected or certified.

## Licensing and release metadata

G-code is covered by the existing root [CERN-OHL-S-2.0 license](../../LICENSE), alongside CAD and hardware documentation. Arduino code remains separately **AGPL-3.0-only** under [arduino/LICENSE](../../arduino/LICENSE). A release/archive must describe this mixed licensing rather than imply either license alone covers every component.

Public packaging version **v11.1.2** adds a Zenodo importer compatibility override; CAD remains **V11**, and designs, all six original G-code files and the Arduino sketch are unchanged. [CITATION.cff](../../CITATION.cff) retains the multiple-license list for GitHub citation. Zenodo uses [.zenodo.json](../../.zenodo.json) in preference to CFF, with the scalar primary hardware license `cern-ohl-s-2.0`. Its description and notes explicitly scope CERN-OHL-S-2.0 to CAD/hardware, G-code and documentation; the Arduino logger only remains AGPL-3.0-only. The scalar metadata does not relicense Arduino, offer an OR choice or grant new rights. The repository is enabled for Zenodo archiving. The parent release workflow will create the GitHub release and verify the resulting DOI. This packaging commit creates no tag or release and assigns no DOI or ORCID. Cite the exact public commit and paths until the verified DOI is added in a separate follow-up.
