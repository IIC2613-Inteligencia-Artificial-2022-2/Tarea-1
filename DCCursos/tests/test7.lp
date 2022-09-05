
%--------------------------------------------------------------------------
% Se definen cursos, prerequisitos, corequisitos, dictates_on, y approved_at
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

course(software).
course(edd).
course(mineria).
course(inferencia).
course(optativo_3).

course(web).
course(infovis).
course(ia).
course(patrones).
course(optativo_4).

course(ssoo).
course(capstone).
course(bdd_2).
course(optativo_5).
course(teologico).


prerequisite(c1, dinamica).
prerequisite(c1, c2).
prerequisite(c2, c3).
prerequisite(c2, edo).
prerequisite(c2, termo).
prerequisite(c2, optimizacion).
prerequisite(lineal, edo).
prerequisite(lineal, optimizacion).

prerequisite(intro_progra, progra_avanzada).
prerequisite(progra_avanzada, bdd).
prerequisite(bdd, bdd_2).
prerequisite(desafios, innova).
prerequisite(progra_avanzada, edd).

prerequisite(discretas, inferencia).
prerequisite(c3, inferencia).
prerequisite(prob, inferencia).

prerequisite(discretas, capstone).
prerequisite(progra_avanzada, capstone).
prerequisite(bdd, capstone).
prerequisite(software, capstone).
prerequisite(mineria, capstone).
prerequisite(edd, capstone).
prerequisite(ia, capstone).


corequisite(arqui, ssoo).
corequisite(lineal, dinamica).
corequisite(c3, electro).

dictates_on(c1, 1).
dictates_on(c1, 2).
dictates_on(lineal, 1).
dictates_on(lineal, 2).
dictates_on(desafios, 1).
dictates_on(etica, 1).
dictates_on(etica, 2).
dictates_on(quim, 1).
dictates_on(quim, 2).
dictates_on(dinamica, 1).
dictates_on(dinamica, 2).
dictates_on(intro_economia, 2).
dictates_on(intro_progra, 1).
dictates_on(c2, 1).
dictates_on(let, 1).
dictates_on(c3, 2).
dictates_on(exploratorio, 1).
dictates_on(edo, 1).
dictates_on(termo, 2).
dictates_on(optativo_1, 2).
dictates_on(proba, 1).
dictates_on(proba, 2).
dictates_on(progra_avanzada, 2).
dictates_on(discretas, 1).
dictates_on(electro, 1).
dictates_on(optativo_2, 1).
dictates_on(innova, 1).
dictates_on(innova, 2).
dictates_on(optimizacion, 2).
dictates_on(bdd, 1).
dictates_on(arqui, 1).
dictates_on(biologico, 1).
dictates_on(software, 2).
dictates_on(edd, 1).
dictates_on(mineria, 2).
dictates_on(inferencia, 1).
dictates_on(optativo_3, 2).
dictates_on(web, 1).
dictates_on(infovis, 1).
dictates_on(ia, 1).
dictates_on(patrones, 2).
dictates_on(optativo_4, 1).
dictates_on(ssoo, 1).
dictates_on(ssoo, 2).
dictates_on(capstone, 2).
dictates_on(bdd_2, 2).
dictates_on(optativo_5, 1).
dictates_on(teologico, 2).

approved_at(c1, 1).
approved_at(desafios, 1).
approved_at(optativo_2, 1).
approved_at(let, 1).
approved_at(quim, 1).

approved_at(lineal, 2).
approved_at(teologico, 2).
approved_at(mineria, 2).
approved_at(optativo_5, 2).
approved_at(c2, 2).