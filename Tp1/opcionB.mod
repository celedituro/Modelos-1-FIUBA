# Definición de variables
set BANCOS;
param COSTO{i in BANCOS, j in BANCOS : i<>j};
param DINERO{i in BANCOS};
param MAX_DINERO;
set CANTIDAD_BANCOS := {0..card(BANCOS) - 1};

var Y{i in BANCOS, j in BANCOS: i<>j} >= 0, binary;
var U{i in BANCOS: i<>'O'} >=0, integer;
var D{j in CANTIDAD_BANCOS} >= 0;
var X{r in BANCOS, i in CANTIDAD_BANCOS} >= 0, binary;

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

## Disponibilidad de dinero
s.t. Disponibilidad{j in CANTIDAD_BANCOS}: D[j] <= MAX_DINERO;

## Orden
s.t. unaCiudadOrden{r in BANCOS: r<>'O'}: sum{i in CANTIDAD_BANCOS} X[r,i] = 1;
s.t. ordenDisp{r in BANCOS: r<>'O'}: sum{i in CANTIDAD_BANCOS} i * X[r,i] = U[r];

## Acumulación de dinero
s.t. Acumulacion{i in CANTIDAD_BANCOS: i >= 1}: D[i-1] + sum{j in BANCOS: j<>'O'} X[j,i] * DINERO[j] = D[i];


