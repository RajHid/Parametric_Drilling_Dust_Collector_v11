// * Discription what the *.scad is about ect.
// Wall mount for EC3 Plgs to make a put troug for connekting a Prusa printer PSU to a enclosed Printer

// The Connectors are very similar:
// The housing of Female connector has a plastic casing that fits in the male plastic casing
// The Female electric Connektor is the one that recives the male slotted one (banana) connector whith springs on the outside

// ==================================
// = Used Libraries =
// ==================================
// Used Librareis and usage
// == Threads ==

//use <threadlib/threadlib.scad>
// LINK:
//// https://github.com/adrianschlatter/threadlib
// USAGE:
//// bolt("M6", turns=10, higbee_arc=30);
//// tap , bolt, nut

//m6();  
/*
module m6(){
    union(){
        difference(){
            cylinder(h=5,d1=25,d2=25, $fn=4);
            bolt("M6", turns=6, higbee_arc=30); // tap , bolt, nut
            translate([12.5,0,5]){
            //cube([25,25,10],center=true);
            }
        }
    }
}
*/
// ==================================
// = Variables =
// ==================================

// == Direct Input Variables ==
BaseWhidth_x=60;
BaseWhidth_y=100;
BaseHeight_z=20;

BaseChamberRadius=4;

WallThickness=4;
// ==== Two Pipe Tube ==== 



TwoPipeTubeDiameter=35;
TwoPipeTubeWallThickness=4; // 3???
TwoPipeTubeAngle_x=70;

// ==== Drillbit==== 

DrilbitMAX_diameter=20;


DrilbitPosition_x=BaseWhidth_x/2;
DrilbitPosition_y=BaseWhidth_y+DrilbitMAX_diameter*1.2;
DrilbitPosition_z=-10;

// === Fitting ===

VacuumFittingDiameter=35.5;
VacuumFittingDiameterNeck=35.95;         // Neck
VacuumFittingLength=35;
VacuumFittingTaper_Factor=1.00625;  
VacuumFittingWallThickness=10;

// === 2 ===


// === 3 ===



// == Positioning Variables ==

// == Dependant Variables ==

// Positioning 


// === Facettes Numbers ===
// - $fn Values for Cylinders and Spheres

FN_HexNut=6;
FN_Performance=36;
FN_Rough=12;
FN_Medium=36;
FN_Fine=72;
FN_ExtraFine=144;

FN_M8=8.00;

// == Calculated Variables

// === 1 ===

// === 2 ===

// === 3 ===

// ==================================
// = Tuning Variables =
// ==================================
// Variables for finetuning (The Slegehammer if something has to be made fit)

// ==================================
// = Test Stage =
// ==================================

// ==================================
// = Test Fitting of Printets Sub Parts =
// ==================================

// Tests the fitting of the hoose by taking a Small lice at a certain Offset to make Rapid Prototyping ultrarapidf
//HOOSE_FIT_TESTER ();
module HOOSE_FIT_TESTER (){
    Intersection_Test_Cut("xz",1,-VacuumFittingLength+1){
        Main_Block_Hull_Assembly();
    }

    difference(){
        Intersection_Test_Cut("xz",1,-1){
            Main_Block_Hull_Assembly();
        }
        translate([0,-10,0]){
            cube([100,100,15]);
        }
    }
}
//HOOSE_FIT_TESTER_2();
module HOOSE_FIT_TESTER_2(){
    difference(){
        Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter+VacuumFittingWallThickness,VacuumFittingDiameterNeck+VacuumFittingWallThickness);
        Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter,VacuumFittingDiameterNeck);
    }
}

module MirrorMirrorOnTheWall(Offset){
    translate([0,Offset,0]){
        children();
        mirror([1,0,0]){
            children();
        }
    }
    translate([0,-Offset,0]){
        mirror([0,1,0]){
            children();
            mirror([1,0,0]){
                children();
            }
        }
    }
}
// == See me ==
//// For Testing and Development

see_me_half(){
    translate([0,0,0]){
        Main_Block_Hull_Assembly();
    }
    translate([0,0,0]){
        Secondary_Block();
    }
    translate([0,0,0]){
        //Main_Chamber_Block_Hull();
    }
    translate([0,0,0]){
        //Two_Pipe_Tube_Hull(TwoPipeTubeDiameter);
    }
    translate([0,0,0]){
        //Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter+VacuumFittingWallThickness,VacuumFittingDiameterNeck+VacuumFittingWallThickness);
    }
    translate([0,0,0]){
        //Hoose_Knie_Inner_Cut(VacuumFittingDiameter,VacuumFittingDiameter);
    }
    translate([0,0,0]){
//        union(){
//            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,0,0,-1);
//            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,-1);
//            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,-1);
//            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,1);
//            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,1);
//        }
    }
    translate([0,0,0]){
        difference(){
//            TwoPipeTube_Base_Shape_Main(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,0,0,WallThickness);
//            Intersection_Triangle_Cutter(); // Erübrigt sich warscheinlich wenn TwoPipeTube_Base_Shape_Main() Wie TwoPipeTube_Base_Shape_Secondary parametrisiert ist
        }
    }
    translate([0,0,0]){
        difference(){
//            Elipsoid_Cutter();
//            Intersection_Triangle_Cutter(); // Erübrigt sich warscheinlich wenn TwoPipeTube_Base_Shape_Main() Wie TwoPipeTube_Base_Shape_Secondary parametrisiert ist
        }
    }
    translate([0,0,0]){
        //Anti_Whistle_Cutter();
    }
    translate([0,0,0]){
        //Hoose_Fitter_Stiffener();
    }
    translate([0,0,0]){
        //Hoose_Fitter_Stiffener_2();
    }
    translate([0,0,0]){
        //Vacuum_Hoose();
    }
    translate([0,0,0]){
        //HELPER_INTERSECT_MCBSvTPT();
    }
    translate([0,0,0]){
        //Wall();
    }
    translate([0,0,0]){
        //Drill_Bit(20);
    }
    translate([0,0,0]){
        //Ring(VacuumFittingDiameter+2*VacuumFittingWallThickness,VacuumFittingDiameter);
    }
    translate([0,0,0]){
//        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,-1);
//        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,-1);
//        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,1);
//        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,1);
    }
}
module see_me_half(){
    //difference(){
        //union(){
          translate([0,0,0]){
            for(i=[0:1:$children-1]){
                a=255;
                b=50;
                k_farbabstand=((a-b)/$children);
                Farbe=((k_farbabstand*i)/255);
                SINUS_Foo=0.5+(sin(((360/(a-b))*k_farbabstand)*(i+1)))/2;
                COSIN_Foo=0.5+(cos(((360/(a-b))*k_farbabstand)*(i+1)))/2;
                color(c = [ SINUS_Foo,
                            1-(SINUS_Foo/2+COSIN_Foo/2),
                            COSIN_Foo],
                            alpha = 0.5){  
                    //MirrorMirrorOnTheWall(0){
                    difference(){
                        //MirrorMirrorOnTheWall(0){
                            render(convexity=20){children(i);} // Uncomment to see a seethrough Model
                            //children(i); // uncomment to get a topologivcal valid manifold
                        
                        //}
// Creates a Cutting to see a Sidesection cut of the objects
                            color(c = [ SINUS_Foo,
                                1-(SINUS_Foo/2+COSIN_Foo/2),
                                COSIN_Foo],
                                alpha = 0.2){
                                translate([BaseWhidth_x,BaseWhidth_y,0]){
                                    //cube([BaseWhidth_x,BaseWhidth_y*20/2,150],center=true);
                                }
                                //cube([30,30,150],center=true);
                            }
                            }
                        }
                    }
                    //MAIN_AXIS_ARRANGEMENT();
                } // sin((2*PI*i)/$children)
            }

// ==================================
// =
// ==================================

// ==================================
// = Stage =
// ==================================
// Final module for Produktion

// Checklist for Real Printing




// ===============================================================================
// =--------------------------------- Enviroment Modules ------------------------=
// ===============================================================================
// Modules that resembles the Enviroment aka the helmet where to atach a camera mount

//VacuumFittingDiameter=35;             // End
//VacuumFittingDiameterNeck=36;         // Neck
//VacuumFittingLength=35;
//VacuumFittingTaper_Factor=0.9875;  
//VacuumFittingWallThickness=5;

//Vacuum_Hoose();
module Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter,VacuumFittingDiameterNeck){
    translate([BaseWhidth_x/2,0,tan(90-TwoPipeTubeAngle_x)*BaseWhidth_y]){
        rotate([90,0,0]){
            cylinder(h=VacuumFittingLength,d1=VacuumFittingDiameterNeck,d2=VacuumFittingDiameter*VacuumFittingTaper_Factor,$fn=36);
        }
    }
}

// Represents the wall to drill a hole in
module Wall(){
    translate([0,0,-50]){
        cube([300,300,100],center=true);
    }
}
// The 20mm SDS+ Drill to get Lan in Every Room
module Drill_Bit(D_Max){
DrilbitMAX_diameter=D_Max;
    translate([DrilbitPosition_x,DrilbitPosition_y,DrilbitPosition_z]){
        cylinder(h=1500,d=DrilbitMAX_diameter);
    }
}
// ===============================================================================
// =--------------------------------- Modules -----------------------------------=
// ===============================================================================

//Two_Pipe_Tube(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,Zero);
module Two_Pipe_Tube(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,Zero){
    DIAMETER_OUT=TwoPipeTubeDiameter;
    WALLTHICKNESS=TwoPipeTubeWallThickness;
    ZERO=Zero;
    difference(){
        translate([BaseWhidth_x/2,BaseWhidth_y,0]){
            rotate([TwoPipeTubeAngle_x,0,0]){
                translate([0,0,0]){
                    linear_extrude(height=100){
                    2D_Tube_Base_Shape(DIAMETER_OUT);
                    }
                }
            }
        }
        Wall();
    }
}
//Triangle_Cutter();
module Triangle_Cutter(){
    translate([0,BaseWhidth_y-WallThickness,0]){
        rotate([TwoPipeTubeAngle_x-96,0,0]){
            translate([0,WallThickness*2,0]){    
                mirror([0,1,0]){
                    cube([BaseWhidth_x,BaseWhidth_y,BaseHeight_z]);
                }
            }
        }
    }
}
//Elipsoid_Cutter();
module Elipsoid_Cutter(){
    translate([BaseWhidth_x/2,BaseWhidth_y/2,0]){
        scale([BaseWhidth_x/2-2*WallThickness,BaseWhidth_y/2-2*WallThickness,BaseHeight_z-WallThickness],$fn=32){
            sphere(1);
        }
    }
}//Anti_Whistle_Cutter();
module Anti_Whistle_Cutter(){
// Cuts away a sharp edgr in the Main Chamber to prevent creating a Whistle
    translate([BaseWhidth_x/2,BaseWhidth_y/3.5,0]){
        cylinder(h=BaseHeight_z,d=BaseWhidth_x/3);
    }
}
module Hoose_Knie(DIAMETER_OUT,DIAMETER_INN){
    difference(){
        Hoose_Knie_Outer_Surface(DIAMETER_OUT,DIAMETER_INN);
        Hoose_Knie_Inner_Cut(DIAMETER_OUT,DIAMETER_INN);
    }
}
module Hoose_Knie_Outer_Surface(DIAMETER_OUT,DIAMETER_INN){
    translate([BaseWhidth_x/2,0,tan(90-TwoPipeTubeAngle_x)*BaseWhidth_y]){
        rotate([90,0,0]){
            hull(){
                for(i=[1:5:20]){
                    rotate([-i+1,0,0]){
                        translate([0,(-i+1)/20,(-i+1)/2.5]){
                            mirror([0,0,1]){
                                linear_extrude(height=VacuumFittingLength/4,center=false,scale=0.8+0.10/i){
                                    2D_Ring_Base_Shape(DIAMETER_OUT,DIAMETER_INN,0);   
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
module Hoose_Knie_Inner_Cut(DIAMETER_OUT,DIAMETER_INN){
    translate([BaseWhidth_x/2,0,tan(90-TwoPipeTubeAngle_x)*BaseWhidth_y]){
        rotate([90,0,0]){
            hull(){
                for(i=[1:5:20]){
                    rotate([-i+1,0,0]){
                        translate([0,(-i+1)/20,(-i+1)/2.5]){
                            mirror([0,0,1]){
                                //scale([0.9,0.9,1]){
                                    linear_extrude(height=VacuumFittingLength/4,center=false,scale=0.8+0.10/i){
                                        2D_Ring_Base_Shape(DIAMETER_OUT,DIAMETER_INN,-3);   
                                }
                            }
                        }
                        linear_extrude(height=VacuumFittingLength/4,center=false,scale=0.8+0.10/i){
                            2D_Ring_Base_Shape(DIAMETER_OUT,DIAMETER_INN,-3);   
                        }
                    }
                }
            }
        }
    }
}
// ===============================================================================
// ---------------------------------- Cutting Modules ----------------------------
// ===============================================================================
// === Half Cutter
// Cuts the Pice in a upper and lower half to be able to put the EC3-Plug in between
module Half_Cutter(HalfCutterOffset,HalfCutterCubeSize){
    difference(){
        children();
        translate([0,HalfCutterOffset,0]){
            cube([HalfCutterCubeSize,HalfCutterCubeSize,HalfCutterCubeSize],center=true);
        }
    }
}
module Bolt(BoltLength){
    translate([0,0,0]){
        rotate([0,0,0]){
            translate([0,0,0]){
                cylinder(h=BoltLength,d1=3.2,d2=3.2,center=false,$fn=FN_Performance);
            }
        }
    }
}
module Bolt_Head(HEADHEIGHT,HEADDIAMETER){
    BoltHeadHeight=HEADHEIGHT;
    BoltHeadDiameter=HEADDIAMETER;
    translate([0,0,0]){
        rotate([0,0,0]){
            translate([0,0,0]){
                cylinder(h=BoltHeadHeight,d1=BoltHeadDiameter,d2=BoltHeadDiameter,center=true,$fn=FN_Performance);
            }
        }
    }
}
module Projection_Cutter(Offset_z){    
    projection(cut = true){
        translate([0,0,Offset_z]){
            children();
        }
    }
}
// ===============================================================================
// ---------------------------------- Intersection Modules -----------------------
// ===============================================================================
//Intersection_Triangle_Cutter();
module Intersection_Triangle_Cutter(){
    DIAMETER_OUT=TwoPipeTubeDiameter;
    WALLTHICKNESS=TwoPipeTubeWallThickness;
    difference(){
        intersection(){
            Triangle_Cutter();
            Main_Chamber_Block_Hull();
        }
    }
}

//Main_Block_Hull_Assembly();
module Main_Block_Hull_Assembly(){
    difference(){
        hull(){
            Main_Chamber_Block_Hull();
            //Two_Pipe_Tube_Hull(TwoPipeTubeDiameter);
            //Two_Pipe_Tube(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1);
            Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter+VacuumFittingWallThickness,VacuumFittingDiameterNeck+VacuumFittingWallThickness);            
        }
        Vacuum_Hoose(VacuumFittingLength,VacuumFittingDiameter,VacuumFittingDiameterNeck);
        Hoose_Knie_Inner_Cut(VacuumFittingDiameter,VacuumFittingDiameter);
        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,0,0,-1);
        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,-1);
        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,-1);
        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,1);
        TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,1);
        difference(){
            TwoPipeTube_Base_Shape_Main(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,0,0,WallThickness);
            Intersection_Triangle_Cutter(); // Erübrigt sich warscheinlich wenn TwoPipeTube_Base_Shape_Main() Wie TwoPipeTube_Base_Shape_Secondary parametrisiert ist
        }
        difference(){
            Elipsoid_Cutter();
            Intersection_Triangle_Cutter(); // Erübrigt sich warscheinlich wenn TwoPipeTube_Base_Shape_Main() Wie TwoPipeTube_Base_Shape_Secondary parametrisiert ist
        }
        Anti_Whistle_Cutter();
    }
}
//!Secondary_Block_Elipsoid_Base_Shape(BaseWhidth_x,BaseWhidth_y,BaseHeight_z,1,2,1);
module Secondary_Block_Elipsoid_Base_Shape( WHIDTH_X,WHIDTH_X2,HEIGHT_Z,
                                            SCLE_X,SCLE_Y,SCLE_Z,
                                            POS_X,POS_Y,POS_Z){
    translate([POS_X,POS_Y,POS_Z]){
            scale([SCLE_X,SCLE_Y,SCLE_Z]){
                cylinder(h=HEIGHT_Z,d1=WHIDTH_X,d2=WHIDTH_X2);
            }
    }
}
module Secondary_Block_Crosshair(){
    translate([BaseWhidth_x/2,BaseWhidth_y+BaseWhidth_y/4,BaseHeight_z]){
        rotate([90,0,0]){
            cylinder(h=BaseWhidth_x*1.5,d=2,center=true,$fn=4);
            rotate([0,90,0]){
                cylinder(h=BaseWhidth_x,d=2,center=true,$fn=4);
            }
        }
    }
}
module Secondary_Block_Tip_Cut_Out(){
    mirror([0,1,0]){
        translate([BaseWhidth_x/2,-BaseWhidth_y-BaseWhidth_y/4+BaseWhidth_y/42,0]){
            rotate([90,0,0]){
                scale([2.05,1,1]){
                    cylinder(h=BaseWhidth_y/2,d=BaseWhidth_x/4,center=false,$fn=64);
                }
                translate([0,0,BaseWhidth_y/4]){
                    scale([2.8,0.7,1]){
                        cylinder(h=BaseWhidth_y/8,d1=BaseWhidth_x/8,d2=BaseWhidth_x/2.2,center=false,$fn=64);
                    }
                }
            }
        }
    }
}

//Secondary_Block();
module Secondary_Block(){
    difference(){
        union(){
            // Sec_Elipsoid_Tip_Shape
            Secondary_Block_Elipsoid_Base_Shape(    BaseWhidth_x,BaseWhidth_x,BaseHeight_z,
                                                    1,2,1,
                                                    BaseWhidth_x/2,BaseWhidth_y,0);
        }
        // Top beveled elipsoid cutout
        Secondary_Block_Elipsoid_Base_Shape(    (BaseWhidth_x-2*WallThickness)/2,BaseWhidth_x-2*WallThickness,BaseHeight_z,
                                                 1,2,1,
                                                 BaseWhidth_x/2,BaseWhidth_y+BaseWhidth_y/4,BaseHeight_z/1.5);
        difference(){
            union(){
                // Mid unbeveled elipsoid cutout
                Secondary_Block_Elipsoid_Base_Shape(    BaseWhidth_x-2*WallThickness,BaseWhidth_x-2*WallThickness,BaseHeight_z,
                                                        0.5,1,1,
                                                        BaseWhidth_x/2,BaseWhidth_y+BaseWhidth_y/4,0);
                // Bottom beveled elipsoid cutout
                Secondary_Block_Elipsoid_Base_Shape(    BaseWhidth_x-2*WallThickness,(BaseWhidth_x-2*WallThickness)/2.5,BaseHeight_z,
                                                        1,2,1,
                                                        BaseWhidth_x/2,BaseWhidth_y+BaseWhidth_y/4,-BaseHeight_z);
            }
            // cutut to the cutout so that necesary parts wont be cut
            translate([0,BaseWhidth_y+BaseWhidth_y/12,0]){
                rotate([180-45,0,0]){
                    cube([BaseWhidth_x,BaseWhidth_x,BaseHeight_z]);
                }
            }
        }
        // cuts the part of the Sec_Elipsoid_Tip_Shape that otherwise will be in the Main Block
        translate([0,0,0]){
            cube([BaseWhidth_x,BaseWhidth_y,BaseHeight_z],center=false,$fn=64);
        }
        // Cuts the prooper Holes vor the secondary Tube (suckes away the dust from the drill bit.)
        translate([0,0,0]){
            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,0,0,-28);
            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,5,0,-28);
            TwoPipeTube_Base_Shape_Secondary(TwoPipeTubeDiameter,TwoPipeTubeWallThickness,1,-5,0,-28);
        }
        // Cross Hair, markes the center of the elipsoid shape
        Secondary_Block_Crosshair();
        // Secondary Block Tip Cut Out, is considered to achive a nice airflow
        Secondary_Block_Tip_Cut_Out();
    }
    // Fills the roundet side holes that remains from the Baseshape
    translate([0,BaseWhidth_y-BaseWhidth_y/24,0]){
        cube([BaseWhidth_x/12,BaseWhidth_y/12,BaseHeight_z]);
    }        
    translate([BaseWhidth_x-BaseWhidth_x/12,BaseWhidth_y-BaseWhidth_y/24,0]){
        cube([BaseWhidth_x/12,BaseWhidth_y/12,BaseHeight_z]);
    }
}

//Two_Pipe_Tube_Hull();
module Two_Pipe_Tube_Hull(DIAMETER_OUT){
    difference(){
        translate([BaseWhidth_x/2,BaseWhidth_y,0]){
            rotate([TwoPipeTubeAngle_x,0,0]){
                translate([0,0,0]){
                    linear_extrude(height=100){
                    2D_Tube_Base_Shape(DIAMETER_OUT);
                    }
                }
            }
        }
        Wall();
    }
}
module Main_Chamber_Block_Hull(){
    Linear_Extruding(BaseHeight_z,0){
        2D_Rounded_Square_Base_Shape(BaseWhidth_x,BaseWhidth_y,BaseChamberRadius);
    }
}
module Intersection_Test_Cut(PLAIN,THICKNESS,OFFSET){
// ==== EXAMPLE ====
//    !Intersection_Test_Cut("xy",1,7/2){sphere(7);};
//    Slices a disc out of a sphere    
// ==== EXAMPLE ====
CubeSIZE=200;

    if (PLAIN=="xz"){
        intersection(){
            children();
            translate([0,OFFSET,0]){
                cube([CubeSIZE,THICKNESS,CubeSIZE],center=true);
            }
        }
    }
    else if (PLAIN=="xy") {
        intersection(){
            children();
            translate([0,0,OFFSET]){
                cube([CubeSIZE,CubeSIZE,THICKNESS],center=true);
            }
        }
    }
    else if (PLAIN=="yz") {
        intersection(){
            children();
            translate([OFFSET,0,0]){
                cube([THICKNESS,CubeSIZE,CubeSIZE],center=true);
            }
        }   
    }
}
// ===============================================================================
// ---------------------------------- Linear Extrude Modules ---------------------
// ===============================================================================

module Linear_Extruding(ExtrudeLength,EXTRUDINGDIRECTIONINVERTER){
// ++++++++++++++++++++++++++++++++
// Value of Zero ("0") extrudes normaly in pos Z-Direction, One ("1") inverts the direction to neg Z-Direction
// ++++++++++++++++++++++++++++++++    
    mirror([0,0,EXTRUDINGDIRECTIONINVERTER]){
    //translate([0,0,Length*ExrtudingDirektionInverter]){
        linear_extrude(height=ExtrudeLength){
            children();
        }
    }
}


module TwoPipeTube_Base_Shape_Secondary(DIAMETER_OUT,WALLTHICKNESS,ZERO,lin_X,lin_Y,lin_Z){
    translate([BaseWhidth_x/2,BaseWhidth_y,0]){
        rotate([TwoPipeTubeAngle_x,0,0]){
            translate([lin_X,lin_Y,lin_Z]){
                linear_extrude(height=100){
                    2D_Tube_Base_Shape_Secondary(DIAMETER_OUT,WALLTHICKNESS,ZERO);
                } 
            }
        }
    }
}
module TwoPipeTube_Base_Shape_Main(DIAMETER_OUT,WALLTHICKNESS,ZERO,lin_X,lin_Y,lin_Z){
    translate([BaseWhidth_x/2,BaseWhidth_y,0]){
        rotate([TwoPipeTubeAngle_x,0,0]){
            translate([0,0,lin_Z]){
                linear_extrude(height=100){
                    2D_Tube_Base_Shape_Main(DIAMETER_OUT,WALLTHICKNESS,ZERO);
                }
            }
        }
    }
}

// ===============================================================================
// ---------------------------------- Rotate Extrude Modules ---------------------
// ===============================================================================

// ===============================================================================
// =--------------------------------- 2D-Shapes ---------------------------------=
// ===============================================================================


// The rectangular shape whit rounded edges the tool is based on 
module 2D_Rounded_Square_Base_Shape(PARAM_X,PARAM_Y,RADIUS){
    translate([RADIUS,RADIUS,0]){
        minkowski(){
            square([PARAM_X-2*RADIUS,PARAM_Y-2*RADIUS]);
            circle(RADIUS);
        }
    }
}

// The Tube 
module 2D_Tube_Base_Shape(DIAMETER_OUT){
        circle(d=DIAMETER_OUT);
}

// Suction tube towards the main chamber that will hold the Tool to the Wall by vacuu... underpressure
module 2D_Tube_Base_Shape_Main(DIAMETER_OUT,WALLTHICKNESS,ZERO){
    translate([0,-DIAMETER_OUT/6,0]){
        scale([6/8,3/5,1]){
            circle(d=(DIAMETER_OUT-WALLTHICKNESS)*ZERO);
        }
    }
}

// Suction tube towards Secondary Chamber (There wher one puts the hole)
module 2D_Tube_Base_Shape_Secondary(DIAMETER_OUT,WALLTHICKNESS,ZERO){
    translate([0,DIAMETER_OUT/4,0]){
        scale([2/3,1/4,1]){
            circle(d=(DIAMETER_OUT-WALLTHICKNESS)*ZERO);
        }
    }
}

// The bendet shape of the Inner cut out (Hoose_Knie_Outer_Surface/Inner) is based on this
module 2D_Ring_Base_Shape(DIAMETER_OUT,DIAMETER_INN,DELTA){
    difference(){
        offset(delta=DELTA){
            circle(d=DIAMETER_OUT);
            circle(d=DIAMETER_INN);
        }
    }
}
// ===============================================================================
// =--------------------------------- Smoothing ---------------------------------=
// ===============================================================================

2D_Smooth_r=1;
// Radius of a outer Tip Rounding 
2D_Fillet_r=1;
// Radius of a inner corner Ronding
2D_Chamfer_DELTA_INN=1;
2D_Chamfer_DELTA_OUT=2;

// a straigt line on edges and corners
2D_Chamfer_BOOLEAN=false;

    
module Smooth(r=3){
    //$fn=30;
    offset(r=r,$fn=30){
        offset(r=-r,$fn=30){
        children();
        }
    }
}
module Fillet(r=3){
    //$fn=30;
    offset(r=-r,$fn=30){
        offset(r=r,$fn=30){
            children();
        }
    }
}
module Chamfer_OUTWARD(DELTA_OUT=3){
    //$fn=30;
    offset(delta=DELTA_OUT,chamfer=true,$fn=30){
        offset(delta=-DELTA_OUT,chamfer=true, $fn=30){
            children();
        }
    }
}
module Chamfer_INWARD(DELTA_INN=3){
    //$fn=30;
    offset(delta=-DELTA_INN,chamfer=true,$fn=30){
        offset(delta=DELTA_INN,chamfer=true, $fn=30){
            children();
        }
    }
}

// ===============================================================================
// =--------------------------------- Ruthex --------------------------------=
// ===============================================================================
// Dimensions for Ruthex Tread inseerts

//RUTHEX_M3();
module RUTHEX_M3(){    
L=5.7+5.7*0.25; // Length + Margin
echo("RUTHEX",L);
D1=4.0;    
    translate([0,0,0]){
        rotate([0,0,0]){
            translate([0,0,0]){
                cylinder(h=L,d1=D1,d2=D1,$fn=FN_Performance);
            }
        }
    }
}

// ===============================================================================
// =--------------------------------- Import STL --------------------------------=
// ===============================================================================

module NAME_OF_IMPORT(){
    rotate([0,0,-90]){
        translate([-515,-100,-45]){
            import("PATH/TO/FILE.stl",convexity=3);
        }
    }
}