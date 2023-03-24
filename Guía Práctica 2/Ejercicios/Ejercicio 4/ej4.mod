# Variables
## Total tableros producidos y comprados
var TP >= 0;
var TCOMP >= 0;

## Tableros producidos y comprados aprobados
var TPA >= 0;
var TCOMPA >= 0;

## Tableros producidos y comprados rechazados
var TPR >= 0;
var TCOMPR >= 0;

## Tipo de tableros
var TA >= 0;
var TB >= 0;
var TC >= 0;
var TD >= 0;

## Tipo de tableros producidos y comprados
var TAP >= 0;
var TBP >= 0;
var TCP >= 0;
var TDP >= 0;

var TAC >= 0;
var TBC >= 0;
var TCC >= 0;
var TDC >= 0;

## Tipo de tableros aprobados producidos y comprados 
var TAPA >= 0;
var TBPA >= 0;
var TCPA >= 0;
var TDPA >= 0;

var TACA >= 0;
var TBCA >= 0;
var TCCA >= 0;
var TDCA >= 0;

## Tipo de tableros aprobados 
var TAA >= 0;
var TBA >= 0;
var TCA >= 0;
var TDA >= 0;

# Funcional
minimize z: 50*TAPA + 60*TBPA + 120*TCPA + 100*TDPA + 80*TACA + 75*TBCA + 180*TCCA + 80*TDCA;

# Restricciones
/* Tableros producidos y comprados por tipo*/
s.t. TA_TOTAL: TA = TAP + TAC;
s.t. TB_TOTAL: TB = TBP + TBC;
s.t. TC_TOTAL: TC = TCP + TCC;
s.t. TD_TOTAL: TD = TDP + TDC;

/* Tableros producidos y comprados */
s.t. TPROD: TP = TAP + TBP + TCP + TDP;
s.t. TCOMPRA: TCOMP = TAC + TBC + TCC + TDC;

/* Tableros aprobados */
s.t. TP_APROB: TPA = 0.9*TP + 0.9*TPR;
s.t. TC_APROB: TCOMPA = 0.8*TCOMP + 0.8*TCOMPR;

/* Tableros rechazados */
s.t. TP_RECH: TPR = 0.1*TP;
s.t. TC_RECH: TCOMPR = 0.2*TCOMP;

/* Tableros aprobados por tipo */
s.t. TP_AP: TPA = TAPA + TBPA + TCPA + TDPA;
s.t. TC_AP: TCOMPA = TACA + TBCA + TCCA + TDCA;

/* Tableros producidos y comprados por tipo y aprobados*/
s.t. TA_APR: TAA = TAPA + TACA;
s.t. TB_APR: TBA = TBPA + TBCA;
s.t. TC_APR: TCA = TCPA + TCCA;
s.t. TD_APR: TDA = TDPA + TDCA;

/* Demanda mínima por tipo */
s.t. DEM_TA: TAA = 4000;
s.t. DEM_TB: TBA = 3000;
s.t. DEM_TC: TCA = 8000;
s.t. DEM_TD: TDA = 5000;

/* Disponibilidad de horas por tipo */
s.t. DISP_FAB: 6500 >= 0.34*TAP + 0.35*TBP + 0.47*TCP + 0.5*TDP;
s.t. DISP_AJ: 1000 >= 0.08*TAP + 0.06*TBP + 0.1*TCP + 0.12*TDP;
s.t. DISP_PROD_COMP: 600 >= 0.02*TAP + 0.03*TAC + 0.03*TBP + 0.05*TBC + 0.03*TCP + 0.04*TCC + 0.03*TDP + 0.04*TDC;

end;