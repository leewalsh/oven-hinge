//Replacement hinge for oven part

base_width = 25;
base_depth = 25;
base_thick = 3;

back_height = 10;
back_width = base_width;
back_thick = 3;

post_r = 1.5;
post_h = 5;

union(){
    translate([0,-base_depth/2+back_thick/2,back_height/2 + base_thick/2]){
        cube([back_width, back_thick, back_height], center=true);
    }
    cube([base_width, base_depth, base_thick], center=true);
    translate([post_r*2 - base_width/2, base_depth/2-post_r*2, base_thick]){
        cylinder(h=post_h, r=post_r, center=true);
    }
    translate([base_width/2 - post_r*2, base_depth/2-post_r*2, base_thick]){
        cylinder(h=post_h, r=post_r, center=true);
    }
}
