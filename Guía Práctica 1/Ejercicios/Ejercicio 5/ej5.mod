# Variables
var x1 >= 0;
var x2 >= 0;

# Funcional
minimize z: 10*x1 + 4*x2;

# Restricciones
s.t. c1: 0.1*x1 >= 0.4;
s.t. c2: 0.1*x2 >= 0.6;
s.t. c3: 0.1*x1 + 0.2*x2 >= 2;
s.t. c4: 0.2*x1 + 0.1*x2 >= 1.7;

end;