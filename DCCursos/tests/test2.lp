
%--------------------------------------------------------------------------
% Se definen cursos y cursos aprobados durante 2 semestres
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

course(proba).
course(progra_avanzada).
course(discretas).
course(electro).
course(optativo_2).

course(innova).
course(optimizacion).
course(bdd).
course(arqui).
course(biologico).

approved_at(c1, 1).
approved_at(quim, 1).
approved_at(lineal, 1).
approved_at(etica, 1).
approved_at(desafios, 1).

approved_at(c2, 2).
approved_at(dinamica, 2).
approved_at(intro_progra, 2).
approved_at(intro_economia, 2).
approved_at(let, 2).