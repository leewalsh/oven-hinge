//Replacement hinge for oven part
//
// * disable
// ! show only
// # highlight
// % transparent

inches = 25.4;  // inches to mm

base_width = 1.125  *inches;
base_depth =  .915  *inches;
base_thick =  .1    *inches;

back_height = .5    *inches;
back_width = base_width;
back_thick = .155   *inches;

post_r = .125/2     *inches;
post_h = .2         *inches;

nub_width   = .125    *inches;
nub_depth   = .025    *inches;

hole_r      = .175/2  *inches;
cone_slope  = (.375/2 *inches - hole_r)/(back_thick-.075*inches);

module base(){ cube([base_width, base_depth, base_thick], center=true); }
module post(){ cylinder(h=post_h, r=post_r); }
module back(){ cube([back_width, back_thick, back_height], center=true); }
module hole(){
    h = back_thick;
    r1 = 0;
    r2 = cone_slope * h + r1;
    rotate([-90,0,0]){ union(){
        cylinder(h=h,r1=r1,r2=r2, center=true); 
        cylinder(h=2*h, r=hole_r, center=true);}
    }
}

difference(){
    union(){
        translate([0,0,base_thick/2]){base();}
        translate([0,-base_depth/2+back_thick/2,back_height/2]){back();}
        translate([post_r - base_width/2, base_depth/2-post_r, base_thick]){post();}
        translate([base_width/2 - post_r, base_depth/2-post_r, base_thick]){post();}
    }
    translate([0, .075/2 + back_thick/2-base_depth/2, .2*inches+hole_r]){hole();}
}
