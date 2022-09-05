% >> Definición del problema <<
% Se resuelve con bound = 6.
rangeY(0..3).
rangeX(0..3).

robot(0..2).
box(0..2).

float(0).
robotOn(0,0,0,0).
robotOn(1,0,1,0).
robotOn(2,0,3,0).

boxOn(0,0,2,0,0).
boxOn(1,1,1,0,0).
boxOn(2,1,3,0,0).

floatOn(0,1,2,0,0).

obstacle(2,0).
obstacle(2,1).
obstacle(2,2).
water(2,3).

portal(1,0,3,2).

goal(3,0).
goal(3,1).
goal(3,3).
