// -----------------------------------------------------------------------------
//
//  Gmsh Unit Square 
//
//  To learn : Geometry basics, elementary entities, physical groups (from Gmsh tutorial t1)
//
// -----------------------------------------------------------------------------


lc = 1e-2;

//Define Points
Point(1) = {0, 0, 0, lc};
Point(2) = {1, 0,  0, lc};
Point(3) = {1, 1, 0, lc};
Point(4) = {0,  1, 0, lc};

//Define Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3,4 };
Line(4) = {4, 1};

//Define Curves
Curve Loop(1) = {1, 2, 3, 4};

//Define Surfaces
Plane Surface(1) = {1};

//Define Boundary Components
Physical Curve(0) = {1};
Physical Curve(1) = {2};
Physical Curve(2) = {3};
Physical Curve(3) = {4};
Physical Surface("Unit Square") = {1};

//2D Mesh and save
// Mesh 2;
// Save "UnitSquare.msh";
