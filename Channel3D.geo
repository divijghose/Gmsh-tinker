// -----------------------------------------------------------------------------
//
//  Purpose: Create a 3D channel 
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
Surface(1) = {1}; // Bottom
Surface(2) = {2}; // Top
Surface(3) = {3}; // Front
Surface(4) = {4}; // Back
Surface(5) = {5}; //Side
Surface(6) = {6}; //Side 

//Surface Loop
Surface Loop(1) = {1,2,3,4,5,6};

//Volume
Volume(1) = {1};


Physical Volume("Channel", 1) = {1};

//2D Mesh and save
// Mesh 2;
// Save "Channel3D.msh";