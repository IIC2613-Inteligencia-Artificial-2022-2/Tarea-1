
%--------------------------------------------------------------------------
% Se definen dictates_on para distintos cursos
%--------------------------------------------------------------------------

semester(1..bound).

course(c1).
course(quim).
course(lineal). 
course(etica).
course(desafios). 

course(c2).
course(dinamica).
course(intro_progra).
course(intro_economia).
course(let).

course(c3).
course(exploratorio).
course(edo).
course(termo).
course(optativo_1).

dictates_on(c1, 1).
dictates_on(quim, 1).
dictates_on(intro_progra, 1).
dictates_on(intro_economia, 1).
dictates_on(let, 1).

dictates_on(c2, 2).
dictates_on(dinamica, 2).
dictates_on(optativo_1, 2).
dictates_on(etica, 2).
dictates_on(termo, 2).

dictates_on(lineal, 1). 
dictates_on(lineal, 2). 
dictates_on(desafios, 1). 
dictates_on(desafios, 2). 
dictates_on(c3, 1).
dictates_on(c3, 2).
dictates_on(exploratorio, 1).
dictates_on(exploratorio, 2).
dictates_on(edo, 1).
dictates_on(edo, 2).