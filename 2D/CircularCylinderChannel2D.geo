// -----------------------------------------------------------------------------
//
//  Purpose: Create a 2D channel with circular cylinder 
//  Author: Divij Ghose
//  History: Implementation started on 04.05.22
//  Description : 
// -----------------------------------------------------------------------------

lc = 1e0;
Lx = 100;
Lz = 50;
r = 10;
xyzCent[]={40,0,0};

//Fixed Points
Point(1)={0,0,Lz/2,lc};
Point(2) = {Lx,0,Lz/2,lc};
Point(3) = {Lx,0,-1*Lz/2,lc};
Point(4) = {0,0,-1*Lz/2,lc};


///Circle
Point(5)={xyzCent[0],xyzCent[1],xyzCent[2],lc};//Centre
Point(6)={xyzCent[0]-r,0,0,lc};
Point(7)={xyzCent[0],0,-1*r,lc};
Point(8)={xyzCent[0]+r,0,0,lc};
Point(9)={xyzCent[0],0,r,lc};






// Lines 
//Bottom
Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {1,4};

Circle(5) = {6,5,7};
Circle(6) = {7,5,8};
Circle(7) = {8,5,9};
Circle(8) = {9,5,6};




//Curve Loops 
Curve Loop(1) = {1,2,3,-4}; //Exterior
Curve Loop(2) = {5,6,7,8}; // Circle




//Surface 
Surface(1) = {1,2}; 

//Define Boundary Components
Physical Curve("Bottom Wall",1) = {1};
Physical Curve("Outlet",2) = {2};
Physical Curve("Top Wall",3) = {3};
Physical Curve("Inlet",4) = {4};
Physical Curve("Cylinder",5) = {5,6,7,8};

Physical Surface("Channel With Cylinder") = {1};

//2D Mesh and save
// Mesh 2;
// Save "ChannelCylinder2D.msh";

