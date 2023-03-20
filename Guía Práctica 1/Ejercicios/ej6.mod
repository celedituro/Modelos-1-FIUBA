# Variables
var x1 >= 0;
var x2 >= 0;

# Funcional
maximize z: 8*x1 + 4*x2;

# Restricciones
s.t. c1: 4*x1 - 2*x2 <= 4;
s.t. c2: 4*x1 + 2*x2 <= 8;
s.t. c3: 1*x1 + 1*x2 >= 1;

end;
