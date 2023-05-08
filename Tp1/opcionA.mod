# Definición de variables
set BANCOS;
param COSTO{i in BANCOS, j in BANCOS : i<>j};
param DINERO{i in BANCOS};
param MAX_DINERO;
param M := 10000000000000000000;

var Y{i in BANCOS, j in BANCOS: i<>j} >= 0, binary;
var U{i in BANCOS: i<>'O'} >=0, integer;
var X{i in BANCOS, j in BANCOS: i<>j} >= 0, binary;
var D{j in BANCOS: j <> 'O'} >= 0;

## Funcional
minimize z: sum{i in BANCOS, j in BANCOS : i<>j} COSTO[i,j] * Y[i,j];

## Restricciones
## Exactamente un banco puede ser visitado antes del banco j
s.t. Hacia{j in BANCOS}: sum{i in BANCOS: i<>j} Y[i,j] = 1;

## Exactamente un banco puede ser visitado después del banco i
s.t. Desde{i in BANCOS}: sum{j in BANCOS: i<>j} Y[i,j] = 1;

## Eliminación de subtours
s.t. Subtours{i in BANCOS, j in BANCOS: i<>j and i<>'O' and j<>'O'}: U[i] - U[j] +
(card(BANCOS) - 1) * Y[i,j] <= card(BANCOS) - 2;

## Acumulación de dinero
s.t. R{j in BANCOS: j<>'O'}: sum{i in BANCOS: i<>'O' and i<>j} DINERO[i] * X[i,j] = D[j];

## Visitas
s.t. VisitoAntesI{i in BANCOS, j in BANCOS: i<>j and i<>'O' and j<>'O'}: X[i,j] * -M <= U[i] - U[j] ;
s.t. VisitoAntesJ{i in BANCOS, j in BANCOS: i<>j and i<>'O' and j<>'O'}: U[i] - U[j] <= -1 + M * (1 - X[i,j]);

## Disponibilidad de dinero
s.t. Disponibilidad{j in BANCOS: j<>'O'}: D[j] <= MAX_DINERO;

end; 