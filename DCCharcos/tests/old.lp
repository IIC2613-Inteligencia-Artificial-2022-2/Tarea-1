% >> Definición del problema <<
% Se resuelve con bound = 14.
rangeX(0..6).
rangeY(0..6).

robot(0..2).
box(0..2).

robotOn(0,0,0,0).
robotOn(1,5,0,0).
robotOn(2,5,2,0).

boxOn(0,0,1,0,0).
boxOn(1,3,0,0,0).
boxOn(2,6,2,0,0).

goal(0,6).
goal(2,1).
goal(6,6).

obstacle(1,0..6).
obstacle(2..5,3).
obstacle(3..6,5).

obstacle(3,1).
obstacle(4,0).
obstacle(5,1).