# Quantyra Photodiode Jig - limited V11 release

The source, STL meshes and print/assembly instructions under `designs/v11/` are released under the CERN Open Hardware Licence Version 2, Strongly Reciprocal (`CERN-OHL-S-2.0`). The unchanged root [LICENSE](LICENSE) governs the CAD, G-code and circuit/setup documentation; Arduino code is licensed separately under [AGPL-3.0-only](arduino/LICENSE). Source Location: https://github.com/Quantyra/photodiode-jig.

## Variants and files

- [Dual-port print and assembly instructions](designs/v11/dual-port/PRINT_SIMPLE_V11.md): fixed two-diode holder with four marked shutter positions (left only, both open, both blocked, right only). [Editable OpenSCAD source](designs/v11/dual-port/dual_photodiode_jig_v11.scad); three matching meshes in [exports/v11-simple/](designs/v11/dual-port/exports/v11-simple/).
- [Single-port print and assembly instructions](designs/v11/single-port/PRINT_SINGLE_V11.md): narrower fixed one-diode holder with manually aligned OPEN and stop-defined CLOSED positions. [Editable OpenSCAD source](designs/v11/single-port/single_photodiode_jig_v11.scad); three matching meshes in [exports/v11-simple-single/](designs/v11/single-port/exports/v11-simple-single/).

Each variant contains its own holder, front shutter and rear drawer. The panels are not interchangeable between variants. Follow the respective guide for supplied orientation, millimetre scale, slicing checks, assembly and operating clearances. Sources and meshes are preserved byte-for-byte from the selected V11 snapshot; the dual-port guide omits private evidence-directory references. No separate historical revisions, prototype/coupon exports, experiment data or patent documents are included. Historical optional coupon modules remain within the unchanged dual-port source.

## Machine-specific G-code

[Six original V11 G-code files, STL mappings, embedded settings, command concerns and SHA-256 manifest](gcode/v11/README.md) are included in packaging version **v11.1.0**. CAD remains V11. Review the machine identity limitations and reslice for other machines.

## Arduino setup

- [Arduino setup and wiring guide](docs/arduino-setup.md): Classic Nano/Uno reference circuit, exact logger sketch, upload instructions and generic baseline/repeat procedure. [Circuit SVG](docs/photodiode-circuit.svg); [reference sketch](arduino/photodiode_logger/photodiode_logger.ino).

## Limits

Dan reports that both single-port and dual-port V11 versions have been printed. For the dual-port V11, he reports that the photodiodes he uses fit perfectly. This user-reported fit observation applies only to his photodiodes in the dual-port V11; it does not establish fit for other diode models. He has not separately reported single-port diode fit, measured package dimensions, light-exclusion results, friction/repeatability or manufacturing yield. Package dimensions and tolerances remain unmeasured; retention and optical/light-tight performance remain unvalidated. Seams and lead exits remain openings. PETG and slicer settings in the guides are starting guidance, not validated manufacturing settings. Inspect layer previews and physically fit-test without forcing the diode or straining leads; no production readiness or broader physical acceptance is claimed. Read all warnings in both guides before use. Covered Source and Products are provided as is, subject to the disclaimer in LICENSE.

A U.S. provisional application has been filed. This is not an issued patent; no confirmed accorded filing date, protection of every released feature, independently verified ownership or enforceability is asserted. Formal receipt/date confirmation, comparison of filing coverage with this release, and rights/licensor-authority review remain pending.

## Licensing and contact

Arduino code is **AGPL-3.0-only** under [arduino/LICENSE](arduino/LICENSE). CAD, G-code, the circuit diagram and setup documentation are **CERN-OHL-S-2.0** under the unchanged root [LICENSE](LICENSE). Commercial use is permitted under either license when its applicable requirements are followed, including AGPL-compliant commercial use of the code. Connecting an independent application does not automatically make it subject to the AGPL; obligations depend on the license terms and how software is combined, modified and conveyed or made available for remote interaction.

- CERN-OHL-S / open-source license information: [info@quantyra.org](mailto:info@quantyra.org).
- Separate paid non-copyleft commercial-license requests for closed-source terms by written agreement: [info@qxcellerate.com](mailto:info@qxcellerate.com).

An inquiry alone grants no rights. A separate license requires a written grant by a party with authority over the relevant rights; no separate commercial license is granted here.

## Version and citation

Machine-readable metadata: [CITATION.cff](CITATION.cff). See the [mixed-license release notes](gcode/v11/README.md#licensing-and-release-metadata). No DOI is assigned here.

Identify the variant, V11, the exact public Git commit SHA and the relevant file paths when citing, modifying or manufacturing this design. Suggested citation: "Quantyra photodiode jig, V11, [single-port or dual-port], Quantyra/photodiode-jig, commit [SHA], [file paths], accessed [date]." Use a commit-pinned repository URL for reproducibility. V11 is a design revision, not a physical validation or certification.
