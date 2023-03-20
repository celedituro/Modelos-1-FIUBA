# Variables
var x1 >= 0;
var x2 >= 0;

# Funcional
maximize z: 12*x1 + 8*x2;

# Restricciones
s.t. c1: x1 >= 50;
s.t. c2: x2 >= 4*x1;
s.t. c3: x1 + 0.4*x2 <= 200;
s.t. c4: 0.5*x1 + x2 <= 200;

end;