# Variables
var x1 >= 0;
var x2 >= 0;

# Funcional
maximize z: 60*x1 + 50*x2;

# Restricciones
s.t. c1: 2*x1 + 4*x2 <= 80;
s.t. c2: 3*x1 + 2*x2 <= 60;
s.t. c3: 4*x1 + 2*x2 <= 100;

end;