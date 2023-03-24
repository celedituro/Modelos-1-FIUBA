# Variables
var A >= 0;
var B1 >= 0;
var B2 >= 0;
var C >= 0;

# Funcional
maximize z: 10*A + 15*B1 + 15*B2 + 18*C;

# Restricciones
s.t. LANA_M: 1.6*A + 1.2*C <= 20;
s.t. LANA_N: 1.8*(B1 + B2) <= 36;
s.t. DEMANDA_B: B1 + B2 >= 10;
s.t. DISP_M1: 5*A + 6*B1 <= 80;
s.t. DISP_M2: 4*B1 + 4*C <= 80;

end;