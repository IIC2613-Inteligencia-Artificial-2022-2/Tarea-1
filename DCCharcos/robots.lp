time(1..bound).

action(up).
action(down).
action(left).
action(right).
action(wait).
action(liftBox).

robotOn(R, X, Y + 1, T + 1) :- exec(R, up, T), robotOn(R, X, Y, T), time(T + 1).
robotOn(R, X, Y - 1, T + 1) :- exec(R, down, T), robotOn(R, X, Y, T), time(T + 1).
robotOn(R, X - 1, Y, T + 1) :- exec(R, left, T), robotOn(R, X, Y, T), time(T + 1).
robotOn(R, X + 1, Y, T + 1) :- exec(R, right, T), robotOn(R, X, Y, T), time(T + 1).
robotOn(R, X, Y, T + 1) :- exec(R, wait, T), robotOn(R, X, Y, T), time(T + 1).

3{boxOn(B, X - 1, Y, 1, T + 1); robotOn(R, X - 1, Y, T + 1); boxOnRobot(B, R, T + 1)}3 :- robotLiftBox(R, B, T), robotOn(R, X - 1, Y, T), time(T + 1), boxOn(B, X, Y, Z, T), robot(R), Z = 0. 
3{boxOn(B, X + 1, Y, 1, T + 1); robotOn(R, X + 1, Y, T + 1); boxOnRobot(B, R, T + 1)}3 :- robotLiftBox(R, B, T), robotOn(R, X + 1, Y, T), time(T + 1), boxOn(B, X, Y, Z, T), robot(R), Z = 0.
3{boxOn(B, X, Y - 1, 1, T + 1); robotOn(R, X, Y - 1, T + 1); boxOnRobot(B, R, T + 1)}3 :- robotLiftBox(R, B, T), robotOn(R, X, Y - 1, T), time(T + 1), boxOn(B, X, Y, Z, T), robot(R), Z = 0. 
3{boxOn(B, X, Y + 1, 1, T + 1); robotOn(R, X, Y + 1, T + 1); boxOnRobot(B, R, T + 1)}3 :- robotLiftBox(R, B, T), robotOn(R, X, Y + 1, T), time(T + 1), boxOn(B, X, Y, Z, T), robot(R), Z = 0. 

boxPickedUp(B, T) :- boxOnRobot(B, R, T). 
boxOn(B, X, Y, 0, T + 1) :- boxOn(B, X, Y, Z, T), Z = 0, not boxPickedUp(B, T + 1), time(T + 1), box(B).

boxOn(B, X, Y, 1, T) :- robotOn(R, X, Y, T), boxOnRobot(B, R, T), time(T).
boxOnRobot(B, R, T + 1) :- boxOnRobot(B, R, T), time(T + 1).

boxAdjacentToRobot(B, R, T) :- robotOn(R, X - 1, Y, T), boxOn(B, X, Y, Z, T), robot(R), time(T), box(B), Z = 0.
boxAdjacentToRobot(B, R, 0) :- robotOn(R, X - 1, Y, 0), boxOn(B, X, Y, Z, 0), robot(R), box(B), Z = 0.
boxAdjacentToRobot(B, R, T) :- robotOn(R, X + 1, Y, T), boxOn(B, X, Y, Z, T), robot(R), time(T), box(B), Z = 0.
boxAdjacentToRobot(B, R, 0) :- robotOn(R, X + 1, Y, 0), boxOn(B, X, Y, Z, 0), robot(R), box(B), Z = 0.
boxAdjacentToRobot(B, R, T) :- robotOn(R, X, Y - 1, T), boxOn(B, X, Y, Z, T), robot(R), time(T), box(B), Z = 0.
boxAdjacentToRobot(B, R, 0) :- robotOn(R, X, Y - 1, 0), boxOn(B, X, Y, Z, 0), robot(R), box(B), Z = 0.
boxAdjacentToRobot(B, R, T) :- robotOn(R, X, Y + 1, T), boxOn(B, X, Y, Z, T), robot(R), time(T), box(B), Z = 0.
boxAdjacentToRobot(B, R, 0) :- robotOn(R, X, Y + 1, 0), boxOn(B, X, Y, Z, 0), robot(R), box(B), Z = 0.

boxesAdjactentToRobot(R, T, N) :- robot(R), N = #count{B : boxAdjacentToRobot(B, R, T)}, time(T).
boxesAdjactentToRobot(R, 0, N) :- robot(R), N = #count{B : boxAdjacentToRobot(B, R, 0)}.

1 {exec(R, A, T) : action(A)} 1 :- robot(R), time(T + 1).

1{robotLiftBox(R, B, T): boxAdjacentToRobot(B, R, T)}1 :- exec(R, liftBox, T), time(T + 1), robot(R).

:- robotLiftBox(R, B, T), boxesAdjactentToRobot(R, T, N), N = 0.

:- robotLiftBox(R1, B, T), robotLiftBox(R2, B, T), R1 != R2. 

:- boxOnRobot(B1, R, T), boxOnRobot(B2, R, T), B1 != B2.

:- robotOn(R, X, Y, T), not rangeX(X).
:- robotOn(R, X, Y, T), not rangeY(Y).
:- boxOn(B, X, Y, Z, T), not rangeX(X).
:- boxOn(B, X, Y, Z, T), not rangeY(Y).
:- robotOn(R, X, Y, T), obstacle(X, Y).
:- boxOn(B, X, Y, Z, T), obstacle(X, Y).

:- robotOn(R1, X, Y, T), robotOn(R2, X, Y, T), R1 != R2.
:- boxOn(B1, X, Y, Z, T), boxOn(B2, X, Y, Z, T), B1 != B2, Z = 0.

:- robotOn(R1, X, Y, T), robotOn(R2, X + 1, Y, T), robotOn(R2, X, Y, T + 1), robotOn(R1, X + 1, Y, T + 1).
:- robotOn(R1, X, Y, T), robotOn(R2, X, Y + 1, T), robotOn(R2, X, Y, T + 1), robotOn(R1, X, Y + 1, T + 1).
:- robotOn(R, X, Y, T), boxOn(B, X, Y, Z, T), Z = 0, box(B), time(T).

at_goal(B, T) :- boxOn(B, X, Y, Z, T), goal(X, Y).
:- box(B), not at_goal(B, bound).


#show time/1.
#show robotOn/4.
#show boxOn/5.
#show obstacle/2.
#show rangeX/1.
#show rangeY/1.
#show goal/2.
#show water/2.
#show floatOn/5.
#show portal/4.
