set NODES;
param cost {NODES, NODES} default Infinity; # Represents initial edge weights
param d {NODES, NODES}; # Shortest path distances
param pred {NODES, NODES}; # Predecessor nodes for path reconstruction
