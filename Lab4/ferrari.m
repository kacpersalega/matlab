function a = ferrari(s)

%normalizacja 
s = s / s(1);

% przygotowanie
a3 = s(2);
a2 = s(3);
a1 = s(4);
a0 = s(5);

a = zeros(1,4);

nowe_wspolczynniki = zeros(1,4);
nowe_wspolczynniki(1) = 1;
nowe_wspolczynniki(2) = (-a2/2);
nowe_wspolczynniki(3) = ((a3*a1 - 4*a0) / 4);
nowe_wspolczynniki(4) = ((4*a2*a0 -((a3)^2)*a0-(a1)^2) / 8);

pierwiastki_k = cardano(nowe_wspolczynniki);
% lub poprostu pierwiastki_k = roots(nowe_wspolczynniki);


if (imag(pierwiastki_k(1)) == 0)
    k = pierwiastki_k(1);
elseif (imag(pierwiastki_k(2)) == 0)
    k = pierwiastki_k(2);
else
    k = pierwiastki_k(3);
end

% obliczenie p i q
p = sqrt(2*k + ((a3)^2)/4 - a2);
q = (k * a3 - a1)/(2*p);

kwadratowe_1 = [1, (a3/2 + p), (k+q)];
delta = kwadratowe_1(2)^2 - 4 * kwadratowe_1(1)*kwadratowe_1(3);
x1 = (-kwadratowe_1(2) + sqrt(delta)) / 2*kwadratowe_1(1);
x2 = (-kwadratowe_1(2) - sqrt(delta)) / 2*kwadratowe_1(1);

kwadratowe_2 = [1, (a3/2 - p), (k-q)];
delta = kwadratowe_2(2)^2 - 4 * kwadratowe_2(1)*kwadratowe_2(3);
x3 = (-kwadratowe_2(2) + sqrt(delta)) / 2*kwadratowe_2(1);
x4 = (-kwadratowe_2(2) - sqrt(delta)) / 2*kwadratowe_2(1);

a(1) = x1;
a(2) = x2;
a(3) = x3;
a(4) = x4;

a = sort(a);
ideal = sort(roots(s).')