radius = 15;
sides = 5;
thickness = 1.5;
bodyHeight = 30;
bodyTwist = 360;
bodyFlare = 1.5;
bodySlices = 50;
bigBase = 45;
baseThickness = 2;
chamfer = 48;
rdelta = 5;

/////// POLY SHAPE
translate([0,0,baseThickness]){
    union(){
    
        polyBase();
        
        translate([0,0,radius]){
    
            linear_extrude(height = bodyHeight, twist = bodyTwist, slices=bodySlices,scale = bodyFlare){
            polyShape(false);
            }   
        }
    }   
}

///// POLY BASE
cylinder(r=bigBase,$fn=sides,h=baseThickness);





//////////////////////
module polyShape(solid){
    
    difference(){
        offset(r=rdelta,$fn = chamfer){
            circle(r=radius,$fn = sides);
        }
        
        if(solid == false){
            
            offset(r=rdelta,$fn = chamfer){
                circle(r=radius-thickness,$fn = sides);
            }
        }
    
    }
}

module polyBase(){
    
    difference(){
        
        cylinder($fn = 5,r1 = 45, r2 = 20, h = 15);
        cylinder($fn = 5,r1 = 45-thickness, r2 = 20-thickness, h  = 15);
    }
    
    
}