// -----------------------------------------------------------------------------
//
//  Purpose: Create a 2D channel 
//  Author: Divij Ghose
//  History: Implementation started on 01.05.22
//  Description : 
// -----------------------------------------------------------------------------

lc = 1e0;
Lx = 100;
Ly = 10;
Lz = 50;

//Fixed Points
Point(1)={0,0,Lz/2,lc};
Point(2) = {Lx,0,Lz/2,lc};
Point(3) = {Lx,0,-1*Lz/2,lc};
Point(4) = {0,0,-1*Lz/2,lc};


// Lines 
//Bottom
Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {1,4};


//Curve Loops 
Curve Loop(1) = {1,2,3,-4}; //Bottom


//Surface 
Surface(1) = {1}; // Bottom


//Define Boundary Components
Physical Curve("Bottom Wall",1) = {1};
Physical Curve("Outlet",2) = {2};
Physical Curve("Top Wall",3) = {3};
Physical Curve("Inlet",4) = {4};
Physical Surface("Channel 2D",1) = {1};

//2D Mesh and save
// Mesh 2;
// Save "Channel2D.msh";