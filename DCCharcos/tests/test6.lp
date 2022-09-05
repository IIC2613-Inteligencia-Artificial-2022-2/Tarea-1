% >> Definición del problema <<
% Se resuelve con bound = 9.
rangeY(0..4).
rangeX(0..4).

robot(0).
box(0).
float(0).

robotOn(0,4,4,0).

boxOn(0,2,0,0,0).
floatOn(0,0,4,0,0).

portal(3,4,0,3).
portal(1,3,0,0).
portal(4,0,3,2).

water(1,0).
water(3,0).

obstacle(0..4,1).
obstacle(0..1,2).
obstacle(4,2).
obstacle(2..4,3).
obstacle(1..2,4).

goal(2,2).
