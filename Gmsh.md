# Elementary Commands
## Points
` Point(1) = {0,0,0,lc};`

## Lines
` Line(1) = {1,2};`

## Curve Loop 
` Curve Loop(1) = {1,2,3-4};`

## Surface
` Plane Surface(1) = {1};`

## Mesh 
` Mesh 2; ` <br>
` Save "mesh.msh"; `

## Volume 
`Volume(1)={1};`

# Transformations 
## Translate 
Syntax <br> `Translate {x-dist,y-dsit,z-dist} {Point{point_tag};}` <br>
x-dist etc can be negative 

## Rotate 
Syntax <br> `Rotate {{x-axis,y-axis,z-axis}, {pivot-x,pivot-y,pivot-z}, angle} {Point{point_tag};}` <br> for example, for rotation about Z, x-axis=0,y-axis=0,z-axis=1

## Duplicate and transform 

Syntax <br>`Translate {x-dist,y-dist,z-dist} { Duplicata{ Point{point_tag}; } }` <br> Returns list of new entities after transformation

## Extrude 
Syntax <br> `Extrude {x-dist,y-dist,z-dist} {Surface{surf_tag};}`
