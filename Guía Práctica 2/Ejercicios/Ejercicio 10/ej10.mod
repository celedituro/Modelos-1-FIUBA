# Variables
## Tipo de flores
var FRTL >= 0;
var FRA >= 0;
var FRR >= 0;
var FC >= 0;
var FM >= 0;
var FR >= 0;
var FR_RRM >= 0;
var FR_RRG >= 0;

## Tipo de atados
var ARTL >= 0;
var ARA >= 0;
var ARR >= 0;
var AC >= 0;
var AM >= 0;

## Tipo de atados
var RRTL >= 0;
var RRA >= 0;
var RRR >= 0;
var RC >= 0;
var RRC >= 0;
var RRM >= 0;
var RRG >= 0;

## Flores crisantemos
var FC_RC >= 0;
var FC_RRC >= 0;
var FC_RRM >= 0;
var FC_RRG >= 0;

## Flores margaritas
var FM_RRC >= 0;
var FM_RRM >= 0;
var FM_RRG >= 0;

## Flores rosas de tallo largo
var FRTL_RRTL >= 0;
var FRTL_RRM >= 0;
var FRTL_RRG >= 0;

## Flores rosas amarillas
var FRA_RRA >= 0;
var FRA_RRM >= 0;
var FRA_RRG >= 0;

## Flores rosas rojas
var FRR_RRR >= 0;
var FRR_RRM >= 0;
var FRR_RRG >= 0;

var VENTAS >= 0;
var COSTOS >= 0;

# Funcional
maximize z: VENTAS + COSTOS;

# Restricciones
/* Cantidad de flores disponibles */
s.t. DISP_FRTL: FRTL = 20*ARTL;
s.t. DISP_FRA: FRA = 50*ARA;
s.t. DISP_FRR: FRR = 50*ARR;
s.t. DISP_FC: FC = 100*AC;
s.t. DISP_FM: FM = 100*AM;
s.t. DISP_FR: FR = FRTL + FRA + FRR;

/* Armado de ramos */
s.t. ARM_RTL: FRTL_RRTL = RRTL;
s.t. ARM_RA: FRA_RRA = 9*RRA;
s.t. ARM_RR: FRR_RRR = 7*RRR;
s.t. ARM_RC: FC_RC = 18*RC;
s.t. ARM_FC_RRC: FC_RRC = 6*RRC;
s.t. ARM_FM_RRC: FM_RRC = 8*RRC;
s.t. ARM_FC_RRM: FC_RRM = 10*RRM;
s.t. ARM_FM_RRM: FM_RRM = 10*RRM;
s.t. ARM_RF_RRM: FR_RRM = 15*RRM;
s.t. ARM_FM_RRG: FM_RRG = 15*RRG;
s.t. ARM_FC_RRG: FC_RRG = 10*RRG;
s.t. ARM_FR_RRG: FR_RRG = 5*RRG;

/* Disponibilidad de cada tipo de rosa */
s.t. OFERTA_FRTL: FRTL >= FRTL_RRTL + FRTL_RRM + FRTL_RRG;
s.t. OFERTA_FRA: FRA >= FRA_RRA + FRA_RRM + FRA_RRG;
s.t. OFERTA_FRR: FRR >= FRR_RRR + FRR_RRM + FRR_RRG;

/* Disponibilidad de tipos de rosas en ramos medianos */
s.t. DISP_FR_RRM: FR_RRM = FRTL_RRM + FRA_RRM + FRR_RRM;

/* Disponibilidad de tipos de rosas en ramos grandes */
s.t. OFERTA_FR_RRG: FR_RRG = FRTL_RRG + FRA_RRG + FRR_RRG;

/* Disponibilidad de crisantemos */
s.t. OFERTA_FC: FC >= FC_RC + FC_RRC + FC_RRM + FC_RRG;

/*Disponibilidad de margaritas */
s.t. OFERTA_FM: FM >= FM_RRC + FM_RRM + FM_RRG;

/* Demanda máxima de cada ramo */
s.t. DEM_RRTL: RRTL <= 650;
s.t. DEM_RRA: RRA <= 350;
s.t. DEM_RRR: RRR <= 250;
s.t. DEM_RC: RC <= 600;
s.t. DEM_RRC: RRC <= 1100;
s.t. DEM_RRM: RRM <= 990;
s.t. DEM_RRG: RRG <= 625;

s.t. VENTA: VENTAS = 3*RRTL + 10*RRA + 8*RRR + 3*RC + 2*RRC + 4*RRM + 6*RRG;
s.t. COSTO: COSTOS = 20*ARTL + 50*ARA + 50*ARR + 100*AC + 100*AM;

end;