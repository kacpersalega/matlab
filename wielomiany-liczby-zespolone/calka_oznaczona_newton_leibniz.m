function output = calka_oznaczona_newton_leibniz(a, x1, x2)

F = calka_z_wielomianu(a);

Fx2 = polyval(F, x2);
Fx1 = polyval(F, x1);

output = Fx2 - Fx1;