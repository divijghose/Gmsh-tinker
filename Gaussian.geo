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

//Lines

Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

//Curve Loops
Curve Loop(1)={1,2,3,4};

//Surface
Surface(1)={1};



//Generate Gaussian Points
step = 2;
s=0;
ptr=0;

For x In {Lx/2-0.1*Lx:Lx/2+0.1*Lx:step}
    p = newp;
    s+=1;
    y = alpha*Exp(-1.0*((x-(Lx/2))^2/2.5^2));
    Point(p) = {x,y,0,lc};
    If (p-1 > 4)
        Spline(s) = {p,p-1};
    EndIf
    orig_point_list[ptr]=p;
    ptr+=1;

    
EndFor

step=Pi/4;

For i In {0:#orig_point_list[]-1:1}
    For theta In {step:Pi:step}
        If (theta==step)
            old = orig_point_list[i];
            s+=1;
            
            my_new_point[] = Rotate {{0,1,0},{Lx/2,0,0},theta} {Duplicata{Point{orig_point_list[i]};}}; 
            Spline(s) = {orig_point_list[i],my_new_point[0]};
            // p+=1;
        
        Else
            old = my_new_point[0];
            s+=1;
           my_new_point[] = Rotate {{0,1,0},{Lx/2,0,0},theta} {Duplicata{Point{orig_point_list[i]};}};
            Spline(s) = {old,my_new_point[0]};
            // p+=1;
            
    
        EndIf
        p=my_new_point[0];
    
    
    
    
    EndFor
    Spline(s+1) = {p,orig_point_list[i]};
    

    EndFor




