set KNOTS; # nodos

param entr symbolic in KNOTS;           # Entranda a la red
param exit symbolic in KNOTS, <> entr;  # Salida desde la red

set ROADS within (KNOTS diff {exit}) cross (KNOTS diff {entr});

param cost {ROADS} >=0;  	# costos
var x {(i,j) in ROADS} >=0;	# 1 ssi (i,j) en la ruta más corta

minimize total: sum{(i,j) in ROADS} cost[i,j] * x[i,j];

subject to start: sum {(entr,j) in ROADS} x[entr,j] = 1;

subject to balance {k in KNOTS diff{entr,exit}}:
	sum {(i,k) in ROADS} x[i,k] = sum {(k,j) in ROADS} x[k,j];
