// Resolution
$fn=50;

// Paramters of the stick
stick_diameter = 7; // Handle Diameter (nominal 7 mm)
height = 30; // Total Height (nominal 30 mm or 65 mm)
wall_thickness = 2; // Thickness of sides/top of magnet area (nominal 2 mm)
recess_depth = 1; // Recess depth of magnet in bottom (nominal 0-1 mm)
taper_height = 7.5; // How tall the taper is (nominal 7.5 mm)

// Magnet Holes (actual + fudge factor)
magnet_radius = 6.35 + 0.35;
magnet_depth = 3.175 + 0.05;

// Calculated parameters
stick_radius = stick_diameter/2.;
stick_height = height - magnet_depth - wall_thickness - recess_depth;

base_width = (magnet_radius*2) + wall_thickness;
base_radius = base_width/2.;

union(){

    // Make the base of the stand with holes for the magnet
    difference(){
        // Base
        cylinder(magnet_depth + wall_thickness + recess_depth,base_radius,base_radius);
        // Make hole for magnet
        cylinder(magnet_depth + wall_thickness, magnet_radius,magnet_radius);
    }
 
    // Make the stick and round topper
    union(){
        // Make the narrow stick
        translate([0,0,magnet_depth + wall_thickness + recess_depth]) cylinder(stick_height,stick_radius,stick_radius);
        // Add the Topper
        translate([0,0,magnet_depth + wall_thickness + recess_depth + stick_height]) sphere(stick_radius);
    }
    
    // Make the strain relief at the base
    translate([0,0,magnet_depth + wall_thickness + recess_depth]) cylinder(taper_height, base_radius, stick_radius);
}