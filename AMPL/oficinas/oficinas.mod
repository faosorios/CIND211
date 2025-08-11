set ORIG;   # origins
set DEST;   # destinations

param C {ORIG,DEST} >= 0;  # shipment costs per unit
var X {ORIG,DEST} >= 0;    # units to be shipped

minimize Total_Cost:
   sum {i in ORIG, j in DEST} C[i,j] * X[i,j];

subject to Oficinas {j in DEST}:
   sum {i in ORIG} X[i,j] = 1;

subject to Personas {i in ORIG}:
   sum {j in DEST} X[i,j] <= 1;
