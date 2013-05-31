//Replacement hinge for oven part

inches = 25.4;  // inches to mm

base_width = 1.13   *inches;
base_depth =  .915  *inches;
base_thick =  .1    *inches;

back_height = .5    *inches;
back_width = base_width;
back_thick = .155   *inches;

post_r = .123/2 *inches;
post_h = .2     *inches;

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
