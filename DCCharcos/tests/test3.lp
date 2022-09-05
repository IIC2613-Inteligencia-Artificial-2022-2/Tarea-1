% >> Definición del problema <<
% Se resuelve con bound = 7.
rangeY(0..3).
rangeX(0..3).

robot(0..1).
box(0..1).
float(0..1).
robotOn(0,0,0,0).
robotOn(1,3,3,0).

boxOn(0,0,1,0,0).
boxOn(1,3,2,0,0).

floatOn(0,1,1,0,0).
floatOn(1,2,2,0,0).

water(1,0).
water(2,0).
water(1,3).
water(2,3).
obstacle(0,2).
obstacle(1,2).
obstacle(2..3,1).

goal(0,3).
goal(3,0).
