function output = metoda_leibnitza_calka_oznaczona(a, C, x1, x2)
% funkcja liczy wartość całki oznaczonej na przedziale [x1,x2] dla całki z
% podanego wielomianu (wektor współczynników a)

a = a(:).'
n = length(a) - 1; % stopien wielomianu
b = [1 ./ ((n + 1):-1:1) .* a, C] % wsp wielomianu po calkowaniu

w_x1 = polyval(b, x1)
w_x2 = polyval(b, x2)

output = w_x2 - w_x1


