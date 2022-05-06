// -----------------------------------------------------------------------------
//
//  Gmsh Unit Cube 
//
//  To learn : Volumes (From t2 tutorial)
//
// -----------------------------------------------------------------------------


lc = 1e-2;

//Define Points
//Bottom Plane
Point(1) = {0, 0, 0, lc};
Point(2) = {1, 0,  0, lc};
Point(3) = {1, 1, 0, lc};
Point(4) = {0,  1, 0, lc};
//Top Plane
Point(5) = {0, 0, 1, lc};
Point(6) = {1, 0,  1, lc};
Point(7) = {1, 1, 1, lc};
Point(8) = {0,  1, 1, lc};

//Define Lines
//Bottom Plane
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3,4 };
Line(4) = {4, 1};
//Top Plane
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7,8 };
Line(8) = {8, 5};
//Front
Line(9) = {1, 5};
Line(10) = {2, 6};
//Back
Line(11) = {3,7 };
Line(12) = {4, 8};

//Define Curves
//Bottom
Curve Loop(1) = {1, 2, 3, 4};
//Top
Curve Loop(2) = {5, 6, 7, 8};
//Front
Curve Loop(3) = {1, 10, -5, -9};
//Back
Curve Loop(4) = {-3, 11,7, -12};
//Left
Curve Loop(5) = {4, 9, -8, -12};
//Right
Curve Loop(6) = {-2, 10, 6, -11};





//Define Surfaces
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};

//Surface Loop
Surface Loop(1) = {1,2,3,4,5,6};

//Volume
Volume(1) = {1};


Physical Volume("Unit Cube", 1) = {1};

//2D Mesh and save
// Mesh 2;
// Save "UnitCube.msh";
