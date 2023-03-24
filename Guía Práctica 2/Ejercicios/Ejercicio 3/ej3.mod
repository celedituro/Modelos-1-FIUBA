# Variables
## Dulces
var C >= 0;
var S >= 0;

## Ingredientes
var A >= 0;
var N >= 0;
var CH >= 0;

## Ingredientes por dulce
var AC >= 0;
var NC >= 0;
var CHC >= 0;

var AS >= 0;
var NS >= 0;
var CHS >= 0;

# Funcional
maximize z: 25*C + 20*S;

# Restricciones
/* Composición de dulces */
s.t. COMP_C: C = AC + NC + CHC;
s.t. COMP_S: S = AS + NS + CHS;

/* Mezcla de dulces */
s.t. N_C: NC >= 0.2*C;
s.t. N_S: NS >= 0.1*S;
s.t. CH_C: CHS >= 0.1*S;

/* Relación entre dulces */
s.t. RA: A = AC + AS;
s.t. RN: N = NC + NS;
s.t. RCH: CH = CHC + CHS;

/* Disponibilidad de ingredientes */
s.t. DISP_A: A <= 100;
s.t. DISP_N: N <= 20;
s.t. DISP_CH: CH <= 30;
end;