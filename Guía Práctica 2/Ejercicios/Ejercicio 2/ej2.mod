# Variables
var A >= 0;
var B >= 0;
var SA >= 0;
var SC >= 0;
var EA >= 0;

var CuA >= 0;
var CuB >= 0;
var SnA >= 0;
var SnB >= 0;
var MgA >= 0;
var MgB >= 0;
var ZnA >= 0;
var ZnB >= 0;
var OtA >= 0;
var OtB >= 0;

var CuSA >= 0;
var CuSC >= 0;
var CuEA >= 0;
var MgSA >= 0;
var MgSC >= 0;
var MgEA >= 0;
var SnSA >= 0;
var SnSC >= 0;
var SnEA >= 0;
var ZnSA >= 0;
var ZnSC >= 0;
var ZnEA >= 0;
var OtSA >= 0;
var OtSC >= 0;
var OtEA >= 0;

var CuASA >= 0;
var CuASC >= 0;
var CuAEA >= 0;
var CuBSA >= 0;
var CuBSC >= 0;
var CuBEA >= 0;

var SnASA >= 0;
var SnASC >= 0;
var SnAEA >= 0;
var SnBSA >= 0;
var SnBSC >= 0;
var SnBEA >= 0;

var MgASA >= 0;
var MgASC >= 0;
var MgAEA >= 0;
var MgBSA >= 0;
var MgBSC >= 0;
var MgBEA >= 0;

var ZnASA >= 0;
var ZnASC >= 0;
var ZnAEA >= 0;
var ZnBSA >= 0;
var ZnBSC >= 0;
var ZnBEA >= 0;

var OtASA >= 0;
var OtASC >= 0;
var OtAEA >= 0;
var OtBSA >= 0;
var OtBSC >= 0;
var OtBEA >= 0;

# Funcional
maximize z: 100*A + 120*B - 10*SA - 40*SC - 50*EA;

# Restricciones
/* Aleaciones */
s.t. c29: A = CuA + ZnA + MgA + SnA + OtA;
s.t. c30: B = CuB + ZnB + MgB + SnB + OtB;

/* Metal por aleación */
s.t. c1: CuA = CuASA + CuASC + CuAEA;
s.t. c2: ZnA = ZnASA + ZnASC + ZnAEA;
s.t. c3: MgA = MgASA + MgASC + MgAEA;
s.t. c4: SnA = SnASA + SnASC + SnAEA;
s.t. c5: OtA = OtASA + OtASC + OtAEA;

s.t. c6: CuB = CuBSA + CuBSC + CuBEA;
s.t. c7: ZnB = ZnBSA + ZnBSC + ZnBEA;
s.t. c8: MgB = MgBSA + MgBSC + MgBEA;
s.t. c9: SnB = SnBSA + SnBSC + SnBEA;
s.t. c10: OtB = OtBSA + OtBSC + OtBEA;

/* Composición de aleación A */
s.t. COMP_CuA: CuA <= A*0.8;
s.t. COMP_SnA: SnA <= A*0.3;
s.t. COMP_ZnA: ZnA >= A*0.5;

/* Composición de aleación B */
s.t. COMP_SnB_MAX: SnB <= B*0.6;
s.t. COMP_SnB_MIN: SnB >= B*0.4;
s.t. COMP_MgB: MgB >= B*0.3;
s.t. COMP_ZnB: ZnB <= B*0.7;

/* Metal por yacimiento */
s.t. c11: CuSA = CuASA + CuBSA;
s.t. c12: SnSA = SnASA + SnBSA;
s.t. c13: MgSA = MgASA + MgBSA;
s.t. c14: ZnSA = ZnASA + ZnBSA;
s.t. c15: OtSA = OtASA + OtBSA;

s.t. c16: CuSC = CuASC + CuBSC;
s.t. c17: SnSC = SnASC + SnBSC;
s.t. c18: MgSC = MgASC + MgBSC;
s.t. c19: ZnSC = ZnASC + ZnBSC;
s.t. c20: OtSC = OtASC + OtBSC;

s.t. c21: CuEA = CuAEA + CuBEA;
s.t. c22: SnEA = SnAEA + SnBEA;
s.t. c23: MgEA = MgAEA + MgBEA;
s.t. c24: ZnEA = ZnAEA + ZnBEA;
s.t. c25: OtEA = OtAEA + OtBEA;

/* Mineral por yacimiento */
s.t. c26: SA = CuSA + MgSA + SnSA + ZnSA + OtSA;
s.t. c27: SC = CuSC + MgSC + SnSC + ZnSC + OtSC;
s.t. c28: EA = CuEA + MgEA + SnEA + ZnEA + OtEA;

/* Composición de metal por yacimiento */
s.t. COMP_CuSA: CuSA = SA*0.2;
s.t. COMP_SnSA: SnSA = SA*0.1;
s.t. COMP_MgSA: MgSA = SA*0.3;
s.t. COMP_ZnSA: ZnSA = SA*0.3;
s.t. COMP_OtSA: OtSA = SA*0.1;

s.t. COMP_CuSC: CuSC = SC*0.1;
s.t. COMP_SnSC: SnSC = SC*0.2;
s.t. COMP_MgSC: MgSC = SC*0.3;
s.t. COMP_ZnSC: ZnSC = SC*0.3;
s.t. COMP_OtSC: OtSC = SC*0.1;

s.t. COMP_CuEA: CuEA = EA*0.05;
s.t. COMP_SnEA: SnEA = EA*0.05;
s.t. COMP_MgEA: MgEA = EA*0.7;
s.t. COMP_ZnEA: ZnEA = EA*0.2;
s.t. COMP_OtEA: OtEA = EA*0.0;

/* Disponibilidad de mineral por yacimiento */
s.t. DISP_SA: SA <= 1000;
s.t. DISP_SC: SC <= 2000;
s.t. DISP_EA: EA <= 1000;
end;