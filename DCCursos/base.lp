% Actividad 1.

% Los cursos aprobados no pueden tener un semestre asignado.



% Todos los cursos que no estén aprobados deben tener un único semestre asignado.



% Los semestres no pueden tener más de 5 ramos asignados.



% Los cursos que sólo se dictan en semestres impares no pueden estar asignados a 
% semestres pares y los cursos que sólo se dictan en semestres pares no pueden 
% ser asignados a semestres impares.




% Actividad 2.

% Si un ramo A es prerrequisito de un ramo B, entonces el ramo A no puede ser 
% asignado en un semestre igual o posterior al del ramo B.



% Si un ramo A es correquisito de un ramo B, entonces el ramo A no puede ser 
% asignado en un semestre posterior al del ramo B.



% Descomenta las siguientes lineas para poder usar el visualizador.

% #show invalid_course/1.
% #show course_on/2.
% #show prerequisite/2.
% #show corequisite/2.
% #show dictates_on/2.
% #show approved_at/2.