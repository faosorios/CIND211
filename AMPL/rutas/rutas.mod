set INTER; # intersecciones (nodos)

param entr symbolic in INTER;           # Entranda a la red
param exit symbolic in INTER, <> entr;  # Salida desde la red

set ROADS within (INTER diff {exit}) cross (INTER diff {entr});

param time {ROADS} >=0;  				# tiempos (costos) de viajes
var Use {(i,j) in ROADS} >=0;   # 1 ssi (i,j) en la ruta más corta

minimize Total_Time: sum{(i,j) in ROADS} time[i,j] * Use[i,j];

subject to Start: sum {(entr,j) in ROADS} Use[entr,j] = 1;

subject to Balance {k in INTER diff{entr,exit}}:
	sum {(i,k) in ROADS} Use[i,k] = sum {(k,j) in ROADS} Use[k,j];