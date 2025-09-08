set Nodos ordered;          # se asume orden ascendente
set P within {Nodos,Nodos}; # el producto cruz D x D, se redefine con el parametro c
param c {P};                # matriz de costos 

# el conjunto de todos los posibles arcos que unen a cada nodo
set Conex {i in Nodos} within P := {(u,v) in P: u==i or v==i};
param n := card(Nodos); # cardinalidad del conjunto D
set S := 0 .. (2**n-1); # numero de elementos en el conjunto potencia
set CPOT {k in S}:={i in Nodos: (k div 2**(ord(i,Nodos)-1)) mod 2 ==1}; # conjunto potencia de los nodos

var x {P} binary; # variable de decision

minimize costos: sum{(i,j) in P} c[i,j] * x[i,j]; # Funcion objetivo

# Aseguramos que todos los nodos deben tener arcos
subject to arcos {i in Nodos}: sum{(u,v) in Conex[i]} x[u,v] >= 1;

# Nuestra solucion tiene que ser un arbol
# Si G tiene |V| vertices, entonces T tiene |V|-1 aristas:
subject to tamano_del_arbol: sum{(i,j) in P} x[i,j] = n -1;

# Esta restriccion indica que no hay ciclos entre nodos
subject to sin_ciclos{k in S: card({i in CPOT[k],j in CPOT[k]:(i,j)in P})>=3}:
sum{i in CPOT[k], j in CPOT[k]: (i,j) in P} x[i,j] <= card(CPOT[k]) - 1;
