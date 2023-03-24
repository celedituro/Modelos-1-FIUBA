Problem:    ej1
Rows:       6
Columns:    4
Non-zeros:  14
Status:     OPTIMAL
Objective:  z = 600 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B            600                             
     2 LANA_M       NU            20                          20            15
     3 LANA_N       NU            36                          36       8.33333
     4 DEMANDA_B    B             20            10               
     5 DISP_M1      B              0                          80 
     6 DISP_M2      B        66.6667                          80 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 A            NL             0             0                         -14
     2 B1           NL             0             0                       < eps
     3 B2           B             20             0               
     4 C            B        16.6667             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err. = 0.00e+00 on row 0
        max.rel.err. = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err. = 0.00e+00 on row 0
        max.rel.err. = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err. = 1.78e-15 on column 2
        max.rel.err. = 1.11e-16 on column 2
        High quality

KKT.DB: max.abs.err. = 0.00e+00 on row 0
        max.rel.err. = 0.00e+00 on row 0
        High quality

End of output
