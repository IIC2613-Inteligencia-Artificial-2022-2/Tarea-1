
%--------------------------------------------------------------------------
% Se definen prerequisitos y corequisitos.
%--------------------------------------------------------------------------

semester(1..bound).

course(innova).
course(optimizacion).
course(bdd).
course(arqui).
course(biologico).

course(proba).
course(progra_avanzada).
course(discretas).
course(electro).
course(optativo_2).

course(c3).
course(exploratorio).
course(edo).
course(termo).
course(optativo_1).

course(c2).
course(dinamica).
course(intro_progra).
course(intro_economia).
course(let).

course(c1).
course(quim).
course(lineal).
course(etica).
course(desafios).

approved_at(c1, 1).
approved_at(quim, 1).
approved_at(lineal, 1).
approved_at(etica, 1).
approved_at(desafios, 1).

prerequisite(c1, c2).
prerequisite(c2, edo).
prerequisite(edo, termo).
prerequisite(termo, optativo_1).
prerequisite(optativo_1, optativo_2).
prerequisite(intro_progra, progra_avanzada).

corequisite(c2, dinamica).
