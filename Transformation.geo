// -----------------------------------------------------------------------------
//
//  Gmsh GEO tutorial 2
//
//  Transformations, extruded geometries, volumes
//
// -----------------------------------------------------------------------------
Include "UnitSquare.geo"

Point(5) = {0,1.4,0,lc};
Line(5) = {4,5};

//Transformations - 

//1. Translate
Translate {1,0,0}{Point{5};}