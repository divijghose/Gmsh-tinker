// -----------------------------------------------------------------------------
//
//  Purpose: Create a Gaussian bump in a 3D channel 
//  Author: Divij Ghose
//  History: Implementation started on 23.04.22
//  Description : 
// -----------------------------------------------------------------------------

lc = 1e-2;
Lx = 100;
Ly = 10;
Lz = 50;
alpha = 8;

//Fixed Points
Point(1)={0,0,Lz/2,lc};
Point(2) = {Lx,0,Lz/2,lc};
Point(3) = {Lx,0,-1*Lz/2,lc};
Point(4) = {0,0,-1*Lz/2,lc};
Point(5)={0,Ly,Lz/2,lc};
Point(6) = {Lx,Ly,Lz/2,lc};
Point(7) = {Lx,Ly,-1*Lz/2,lc};
Point(8) = {0,Ly,-1*Lz/2,lc};

// Lines 
//Bottom
Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {1,4};
//Top
Line(5) = {5,6};
Line(6) = {6,7};
Line(7) = {7,8};
Line(8) = {5,8};
//Front
Line(9) = {1,5};
Line(10) = {2,6};

//Back
Line(11) = {4,8};
Line(12) = {3,7};

//Curve Loops 
Curve Loop(1) = {1,2,3,-4}; //Bottom
Curve Loop(2) = {5,6,7,-8}; //Top
Curve Loop(3) = {9,5,-10,-1}; //Front
Curve Loop(4) = {11,-7,-12,3}; //Back
Curve Loop(5) = {9,8,-11,-4}; //Side
Curve Loop(6) = {10,6,-12,-2}; //Side



//Surface 
// Surface(1) = {1}; // Bottom
Surface(2) = {2}; // Top
Surface(3) = {3}; // Front
Surface(4) = {4}; // Back
Surface(5) = {5}; //Side
Surface(6) = {6}; //Side 

//Generate Gaussian Points
step = 0.2;
// s=0;
ptr=0;
s=0;
cl = 6;
ptrs=0;
For x In {Lx/2-0.1*Lx:Lx/2:step}
    p = newp;
    y = alpha*Exp(-1.0*((x-(Lx/2))^2/2.5^2));
    Point(p) = {x,y,0,lc};
    If (p-1 > 8)
        s = newc;
        Spline(s) = {p-1,p};
        orig_spline_list[ptrs]=s;
        orig_spline_list_copy[ptrs]=s;

        ptrs+=1;
    EndIf
    orig_point_list[ptr]=p;
    orig_point_list_copy[ptr]=p;

    ptr+=1;

    
EndFor

cl+=1;
Curve Loop(cl) = {orig_spline_list[]};


theta=0;
step=Pi/16;
d=0;

For thetastep In {0:30:1}
    theta=step;
    ptrn=0;
    For i In {0:#orig_point_list[]-1:1}
        old = orig_point_list[i];
        
        xyz[]=Point{orig_point_list[i]};
        my_new_point[] = Rotate {{0,1,0},{Lx/2,xyz[1],0},theta} {Duplicata{Point{orig_point_list[i]};}};
        my_new_point_list[i] = my_new_point[0];
        If (i!=0)
            d = newc;
            Spline(d) = {my_new_point_list[i-1],my_new_point_list[i]};
            new_spline_list[ptrn]=d;
            ptrn+=1;    
        EndIf              
    EndFor

    
    ptrc=0;
    For i In {0:#orig_point_list[]-1:1}
        k = newc;
        Spline(k) = {orig_point_list[i],my_new_point_list[i]};
        my_cross_spline_list[ptrc]=k;
        ptrc+=1;
    EndFor

    For i In {1:#orig_point_list[]-1:1}
        cl+=1;
        surf=news;
        Curve Loop(cl) = {orig_spline_list[i-1],my_cross_spline_list[i],-1*new_spline_list[i-1],-1*my_cross_spline_list[i-1]};
        Ruled Surface(surf)={cl};
    EndFor

    For i In {0:#orig_point_list[]-1:1}
        orig_point_list[i]=my_new_point_list[i];
    EndFor

    For i In {0:#orig_point_list[]-2:1}
        orig_spline_list[i]=new_spline_list[i];
    EndFor

    
EndFor
ptrc=0;
For i In {0:#orig_point_list[]-1:1}
    k = newc;
    Spline(k) = {orig_point_list_copy[i],my_new_point_list[i]};
    my_cross_spline_list[ptrc]=k;
    ptrc+=1;
EndFor
For i In {1:#orig_point_list[]-1:1}
    cl+=1;
    surf=news;
    Curve Loop(cl) = {orig_spline_list_copy[i-1],my_cross_spline_list[i],-1*new_spline_list[i-1],-1*my_cross_spline_list[i-1]};
    Ruled Surface(surf)={cl};
EndFor




// // m=0;
// d=s+1;
// For i In {0:#orig_point_list[]-1:1}
//     For theta In {step:2*Pi:step}
//         If (theta==step)
//             old = orig_point_list[i];
//             d+=newc;
//             xyz[]=Point{orig_point_list[i]};
            
//             my_new_point[] = Rotate {{0,1,0},{Lx/2,xyz[1],0},theta} {Duplicata{Point{orig_point_list[i]};}};

//             Printf("New Point %g",my_new_point[0]);
    
    
//             Spline(d) = {orig_point_list[i],my_new_point[0]};
//             // p+=1;
        
//         Else
//             old = my_new_point[0];

//             xyz[]=Point{orig_point_list[i]};
            
//             Printf("Old Point %g",old);
//             d=newc;
//            my_new_point[] = Rotate {{0,1,0},{Lx/2,xyz[1],0},theta} {Duplicata{Point{orig_point_list[i]};}};

//             Spline(d) = {old,my_new_point[0]};
//             // p+=1;
//             Printf("New Point %g",my_new_point[0]);
            
    
//         EndIf
//         m=my_new_point[0];
    
    
    
    
//     EndFor
//     d+=1;
//     Spline(d) = {m,orig_point_list[i]};

//     EndFor//


