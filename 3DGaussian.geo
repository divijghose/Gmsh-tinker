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




