function n = cardano(m)
% n - miejsca zerowe
% m = wspolczynniki wielomianu 

%np dla 5x^3 - x^2 -9x +9 

%normalizacja 
m = m / m(1);

%przygotowanie

a2 = m(2);
a1 = m(3);
a0 = m(4);

n = zeros(1,3);

%obliczenie p i q
p = (3*a1 - (a2)^2)/9;
q = ((a2)^3)/27 - (a2*a1)/6 + a0/2;

% obliczenie D
D = q^2 + p^3;


if D >= 0
    u = nthroot(-q + sqrt(D), 3);
    v = nthroot(-q - sqrt(D), 3);
    y1 = u + v;
    y2 = (-1/2)*(u + v) + j*(sqrt(3)/2 * (u -v));
    y3 = (-1/2)*(u + v) - j*(sqrt(3)/2 * (u -v));

else
    phi = acos((-q)/(sqrt(-(p^3))));
    y1 = 2*sqrt(-p) * cos((phi + 2 * pi * (1-1)) / 3);
    y2 = 2*sqrt(-p) * cos((phi + 2 * pi * (2-1)) / 3);
    y3 = 2*sqrt(-p) * cos((phi + 2 * pi * (3-1)) / 3);
end

x1 = y1 - a2/3;
x2 = y2 - a2/3;
x3 = y3 - a2/3;

n(1) = x1;
n(2) = x2;
n(3) = x3;

ideal = roots(m).';
blad = max(abs(sort(n) - sort(ideal)));

