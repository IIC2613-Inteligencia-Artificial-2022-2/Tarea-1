% >> Definición del problema <<
% Se resuelve con bound = 4.
rangeY(0..3).
rangeX(0..3).

robot(0..1).
box(0..1).

robotOn(0,0,0,0).
robotOn(1,3,0,0).

boxOn(0,1, 0,0,0).
boxOn(1,3,1,0,0).

obstacle(0,2).
obstacle(1,1).
obstacle(2,0).
obstacle(2,1).
obstacle(2,2).
obstacle(3,3).

portal(0,1,2,3).
portal(3,2,0,3).

goal(1,2).
goal(1,3).
