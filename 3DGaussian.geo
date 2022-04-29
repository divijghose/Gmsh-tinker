// -----------------------------------------------------------------------------
//
//  Purpose: Create a Gaussian bump in a 2D channel 
//  Author: Divij Ghose
//  History: Implementation started on 23.04.22
//  Description : Channel with length 380 units and depth 4.5 units, 
//                Gaussian topology with peak of 4 units centred at x=190. 
//
// -----------------------------------------------------------------------------


lc = 1e0;
Lx = 100;
Ly = 10;
alpha = 4;

//Fixed Points
Point(1) = {0,0,0,lc};
Point(2) = {Lx,0,0,lc};
Point(3) = {Lx,Ly,0,lc};
Point(4) = {0,Ly,0,lc};

// //Lines

// Line(2) = {2,3};
// Line(3) = {3,4};
// Line(4) = {4,1};

// //Curve Loops
// Curve Loop(1)={1,2,3,4};

////Surface
// Surface(1)={1};

// Mesh 2;

//Generate Gaussian Points
step = 0.2;
// s=0;
ptr=0;
s=0;
cl = 0;
For x In {Lx/2-0.1*Lx:Lx/2:step}
    p = newp;
    y = alpha*Exp(-1.0*((x-(Lx/2))^2/2.5^2));
    Point(p) = {x,y,0,lc};
    If (p-1 > 4)
        s = newc;
        Spline(s) = {p-1,p};
    EndIf
    orig_point_list[ptr]=p;
    orig_spline_list[ptr]=s;
    ptr+=1;

    
EndFor

Curve Loop(cl) = {orig_spline_list[]};


step=Pi/16;
// m=0;
d=s+1;
For i In {0:#orig_point_list[]-1:1}
    For theta In {step:2*Pi:step}
        If (theta==step)
            old = orig_point_list[i];
            d+=newc;
            xyz[]=Point{orig_point_list[i]};
            
            my_new_point[] = Rotate {{0,1,0},{Lx/2,xyz[1],0},theta} {Duplicata{Point{orig_point_list[i]};}};

            Printf("New Point %g",my_new_point[0]);
    
    
            Spline(d) = {orig_point_list[i],my_new_point[0]};
            // p+=1;
        
        Else
            old = my_new_point[0];

            xyz[]=Point{orig_point_list[i]};
            
            Printf("Old Point %g",old);
            d=newc;
           my_new_point[] = Rotate {{0,1,0},{Lx/2,xyz[1],0},theta} {Duplicata{Point{orig_point_list[i]};}};

            Spline(d) = {old,my_new_point[0]};
            // p+=1;
            Printf("New Point %g",my_new_point[0]);
            
    
        EndIf
        m=my_new_point[0];
    
    
    
    
    EndFor
    d+=1;
    Spline(d) = {m,orig_point_list[i]};

    EndFor



// Line(1) = {1,5};

// Line(5) = {p,2};




//+
Spline(1367343905) = {862, 893};
//+
Spline(1367343906) = {1111, 1142};
//+
Curve Loop(1) = {1367343107, 1367343108, 1367343109, 1367343110, 1367343111, 1367343112, 1367343113, 1367343114, 1367343115, 1367343116, 1367343117, 1367343118, 1367343119, 1367343120, 1367343121, 1367343122, 1367343123, 1367343124, 1367343125, 1367343126, 1367343127, 1367343128, 1367343129, 1367343130, 1367343131, 1367343132, 1367343133, 1367343134, 1367343135, 1367343136, 1367343105, 1367343106};
//+
Curve Loop(2) = {1367343139, 1367343140, 1367343141, 1367343142, 1367343143, 1367343144, 1367343145, 1367343146, 1367343147, 1367343148, 1367343149, 1367343150, 1367343151, 1367343152, 1367343153, 1367343154, 1367343155, 1367343156, 1367343157, 1367343158, 1367343159, 1367343160, 1367343161, 1367343162, 1367343163, 1367343164, 1367343165, 1367343166, 1367343167, 1367343168, 1367343137, 1367343138};
//+
Plane Surface(1) = {1, 2};
//+
Curve Loop(3) = {102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 100, 101};
//+
Curve Loop(4) = {265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 263, 264};
//+
Plane Surface(2) = {3, 4};
//+
Surface(3) = {3, 4};
//+
Spline(1367343907) = {863, 894};
//+
Curve Loop(5) = {1367343139, 1367343907, -1367343171, -1367343905};
//+
Plane Surface(3) = {5};
