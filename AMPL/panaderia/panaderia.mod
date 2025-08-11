# variables
var x >= 0; # pan integral
var y >= 0; # pan corriente

# funcion objetivo
maximize z: 5 * x + 4 * y;

# restricciones
subject to harina: 1.5 * x + 2 * y <= 300;
subject to horno: 2 * x + y <= 180;
