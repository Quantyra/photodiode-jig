// Fixed single-port V11 companion; all three printed parts are NEW.
// Derived locally from accepted dual V11; accepted source is untouched.
// Provisional package dimensions, not measured fit. Units mm.
// FRONT/light entry: +x right, +y up, +z toward light; leads exit -y.
// Assembly body z=0..8. Individual exports are already on the bed.
$fn = 48;
part = "holder"; // holder, rear_cover, front_shutter, assembly
state = "closed"; // open, closed, exploded, custom
print_ready = true;
rear_x = 0; // seated at 0; slide toward -x for intentional removal
front_x = 0; // used only by state="custom" verification
show_envelopes = true;

body_x = 34;
body_y = 30;
body_z = 8;
diode_y = 3;
pocket_d = 3.60;
lead_groove_end_y = diode_y+3.35/2+0.5; // Preserve exact v4 endpoint independently of head bore.
pocket_depth = 4.8;
flange_d = 5.5;       // <=1 mm estimate was RADIAL overhang, one flat side
flange_depth = 1.2;   // axial thickness UNMEASURED; provisional
aperture_d = 2;

slide_clearance = 0.4; // per lateral side; initial FDM fit
slide_z_clearance = 0.4; // independently adjustable, EACH vertical bearing face
panel_y = 26;
panel_t = 2;
rail_lip = 1.6;
rail_overlap = 1.2; // preserve the -y wire-side guide and exit clearance
rear_gap = 2.4;        // wire cavity: body underside to cover inner face
assumed_flange_t = 1.2; // UNMEASURED; update after part measurement
retaining_gap = 0.6;   // nominal non-preload axial gap at flange lands
lead_slot_w = 1.6;
lead_slot_depth = 2;
lead_pitch = 2.54;
wire_exit_w = 2.2;
wire_exit_drop = 2.5; // Clear bent leads through full 1.0 mm axial travel to lowest lands.

shutter_travel = 5; // CLOSED insertion stop; OPEN is manually aligned at 0.
shutter_left = -body_x/2-shutter_travel-3;
shutter_stop_right = -body_x/2-shutter_travel;
shutter_window_d = 4;
eps = 0.02;

front_bottom = body_z + slide_z_clearance;
front_top = front_bottom + panel_t;
front_cap_bottom = front_top + slide_z_clearance;
front_cap_top = front_cap_bottom + rail_lip;
rear_top = -rear_gap;
rear_bottom = rear_top - panel_t;
rear_cap_top = rear_bottom - slide_z_clearance;
rear_cap_bottom = rear_cap_top - rail_lip;
rear_ceiling = rear_top + slide_z_clearance;
flange_back_z = flange_depth-assumed_flange_t;
retaining_top = flange_back_z-retaining_gap;
open_x = 0;
closed_x = shutter_travel;

assert(shutter_stop_right+closed_x == -body_x/2, "CLOSED stop meets loading edge");
assert(shutter_left+closed_x <= -body_x/2-2, "Grip remains outside at stop");
assert(flange_d > pocket_d, "Flange must retain a shoulder");
assert(flange_depth > 0 && flange_depth < pocket_depth-0.01,
       "flange_depth must be inside the original pocket depth");
assert(slide_clearance >= 0.25 && body_y/2-panel_y/2-slide_clearance >= 1.2,
       "slide_clearance must be >=0.25 and leave >=1.2 mm rail walls");
assert(rear_gap >= 1.5, "rear_gap must leave provisional lead-bend space");
assert(slide_z_clearance >= 0.25 && slide_z_clearance <= 0.55,
       "slide_z_clearance must be 0.25..0.55 per bearing face");
assert(retaining_gap > slide_z_clearance+0.1,
       "lands need a non-preload gap even at maximum cover lift");
assert(retaining_top-rear_top > 1.4+0.2,
       "increase rear_gap: lands must stop flange before representative bent leads touch cover");
assert(shutter_travel-slide_clearance > (shutter_window_d+aperture_d)/2+1,
       "closed shutter needs >1 mm solid optical overlap");
if (part == "holder") {
    if (print_ready) translate([0,0,body_x/2]) rotate([0,-90,0]) holder();
    else holder();
} else if (part == "rear_cover") {
    translate([0,0,print_ready ? -rear_bottom : 0]) rear_cover();
} else if (part == "front_shutter") {
    translate([0,0,print_ready ? -front_bottom : 0]) front_shutter();
} else if (part == "assembly") assembly(state);
else assert(false,"Unknown part selector");

module box(x0,x1,y0,y1,z0,z1) {
    translate([x0,y0,z0]) cube([x1-x0,y1-y0,z1-z0]);
}

module holder() {
    difference() {
        union() {
            box(-body_x/2,body_x/2,-15,15,0,body_z);
            guide_rails(front_cap_bottom,front_cap_top,body_z,front_cap_top);
            guide_rails(rear_cap_bottom,rear_cap_top,rear_cap_bottom,0);
            // Upper rear bearing lips bound cover lift as well as downward motion.
            guide_rails(rear_ceiling,rear_ceiling+rail_lip,rear_cap_bottom,0);
            // Rear far-end wall: rail ends overlap; loading is from -x only.
            box(body_x/2-1+slide_clearance,body_x/2,-15,15,rear_cap_bottom,0);
            // 45-degree side-print gussets beneath the cover. They meet before
            // the far wall starts, reducing its 26.8 mm bridge to <=4.8 mm.
            for (s=[-1,1]) translate([0,0,rear_cap_bottom])
                linear_extrude(rail_lip)
                    polygon([[body_x/2-14.8,s*13.4],[body_x/2-1.4,0],[body_x/2,0],[body_x/2,s*13.4]]);
        }
        for (cx=[0]) {
            optical_pocket(cx);
            for (dx=[-lead_pitch/2,lead_pitch/2]) {
                // Continuous pocket -> old trench -> rear edge; widened for routing.
                box(cx+dx-lead_slot_w/2,cx+dx+lead_slot_w/2,
                    -15-eps,lead_groove_end_y,-eps,lead_slot_depth);
                // Through the -y rail wall as well as the body edge.
                box(cx+dx-wire_exit_w/2,cx+dx+wire_exit_w/2,
                    -15-eps,-11,-wire_exit_drop,lead_slot_depth);
            }
        }
        // Rear cross-trench connects exactly two lead grooves.
        box(-body_x/2+2,body_x/2-2,-14,-11,-eps,2);

    }
}

module optical_pocket(cx=0) {
    // Preserve accepted V11 stepped cutters, including the -0.01 bore offset.
    translate([cx,diode_y,pocket_depth/2-0.01])
        cylinder(d=pocket_d,h=pocket_depth,center=true);
    translate([cx,diode_y,-0.01]) cylinder(d=flange_d,h=flange_depth+0.01);
    top_wall=body_z-pocket_depth;
    translate([cx,diode_y,body_z-top_wall/2+0.01])
        cylinder(d=aperture_d,h=top_wall+1,center=true);
}

module guide_rails(cap0,cap1,wall0,wall1) {
    for (s=[-1,1]) {
        if (s>0) {
            box(-body_x/2,body_x/2,panel_y/2+slide_clearance,15,wall0,wall1);
            box(-body_x/2,body_x/2,panel_y/2-rail_overlap,15,cap0,cap1);
        } else {
            box(-body_x/2,body_x/2,-15,-panel_y/2-slide_clearance,wall0,wall1);
            box(-body_x/2,body_x/2,-15,-panel_y/2+rail_overlap,cap0,cap1);
        }
    }
}

module rear_cover() {
    union() {
        box(-body_x/2-2,body_x/2-1,-panel_y/2,panel_y/2,rear_bottom,rear_top);
        // Fixed insertion stop; no withdrawal restraint.
        box(-body_x/2-2,-body_x/2,-panel_y/2,panel_y/2,rear_bottom,0.8);
        box(-body_x/2-6,-body_x/2,-5,5,rear_bottom,rear_top); // simple finger pull
        retaining_lands();
    }
}

module retaining_lands() {
    // Two forward lands per flange. Keeping ALL lands ahead of the roots also
    // avoids sweeping through the bent -y leads while this panel slides along x.
    for (cx=[0]) {
        for (s=[-1,1]) {
            if (s<0) box(cx-1.7,cx-0.4,4,5,rear_top-eps,retaining_top);
            else box(cx+0.4,cx+1.7,4,5,rear_top-eps,retaining_top);
        }
    }
}

module front_shutter() {
    difference() {
        union() {
            box(shutter_left,body_x/2,-panel_y/2,panel_y/2,front_bottom,front_top);
            // CLOSED insertion stop; OPEN is a mark, not a detent.
            box(shutter_left,shutter_stop_right,-panel_y/2,6,front_bottom,front_cap_top);
        }
        for (cx=[0])
            translate([cx,diode_y,front_bottom-eps])
                cylinder(d=shutter_window_d,h=panel_t+2*eps);
        // Align chosen tick to the SAME upper loading rail edge x=-17.
        // O = OPEN, C = CLOSED. Engraving leaves 1.4 mm plate thickness.
        for (m=[[-body_x/2,"O"],[-body_x/2-shutter_travel,"C"]]) {
            box(m[0]-0.25,m[0]+0.25,9.5,11.5,front_top-0.6,front_top+eps);
            translate([m[0],7.6,front_top-0.6]) linear_extrude(0.6+eps)
                text(m[1],size=3,halign="center",valign="center",font="Arial:style=Bold");
        }
    }
}

module diode_envelopes() {
    // Representative ONLY: 3.0 barrel, <=5.0 flange, 1.2 flange thickness.
    // Envelopes are separate verification/preview objects, not printable outputs.
    for (cx=[0]) {
        translate([cx,diode_y,flange_depth]) cylinder(d=3,h=3.4);
        translate([cx,diode_y,flange_back_z]) intersection() {
            cylinder(d=5,h=assumed_flange_t);
            box(-3,3,-3,2.1,-eps,assumed_flange_t+eps); // one flat side
        }
    }
}

module lead_envelopes() {
    // 0.6 mm diameter leads, 0.8 mm bend radius, leaving -y at z=-1.1.
    translate([0,0,flange_back_z])
    for (cx=[0]) for (dx=[-lead_pitch/2,lead_pitch/2]) {
        translate([cx+dx,diode_y,-0.3]) cylinder(d=0.6,h=0.3);
        for (a=[0:10:80]) hull() for (b=[a,a+10])
            translate([cx+dx,diode_y-0.8+0.8*cos(b),-0.3-0.8*sin(b)]) sphere(d=0.6,$fn=16);
        translate([cx+dx,-18,-1.1]) rotate([-90,0,0])
            cylinder(d=0.6,h=diode_y-0.8+18);
    }
}

function shutter_offset(s) =
    s=="open" ? open_x : s=="closed" ? closed_x :
    s=="exploded" ? -45 : s=="custom" ? front_x :
    assert(false,"Unknown shutter state") 0;

module assembly(s="closed") {
    color([0.23,0.35,0.42]) holder();
    color([0.8,0.57,0.17]) translate([s=="exploded" ? -45 : rear_x,0,0]) rear_cover();
    color([0.18,0.66,0.64]) translate([shutter_offset(s),0,s=="exploded" ? 16 : 0]) front_shutter();
    if (show_envelopes) {
        color([0.65,0.25,0.22]) diode_envelopes();
        color("silver") lead_envelopes();
    }
}
