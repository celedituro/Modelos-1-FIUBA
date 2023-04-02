# Variables
var P1 >= 0;
var SF1 >= 0;
var V1 >= 0;
var P2 >= 0;

# Funcional
maximize z: 10*P1 + 10*P2;

# Restricciones

/* Relación producción, stock final y venta */
s.t. P1VS: P1 = SF1 + V1;

/* Disponibilidad de horas de máquina por mes */
s.t. DISP_M1: 5000 >= 2*P1;
s.t. DISP_M2: 5000 >= 2*P2;

/* Disponibilidad de materia prima */
s.t. MT_M1: 150 >= 1.5*P1;
s.t. MT_M2: 150 >= 1.5*P2;

/* Demanda de muñecos por mes */
s.t. DEM_M1: P1 >= 70;
s.t. DEM_M2: P2 + SF1 >= 110;

end;