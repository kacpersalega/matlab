function wynik = metoda_trapezow(a, x1, x2, dx);
% ta funkcja liczy calke oznacza z wielomianu (a - wektor wsp.)
% na przedziale [x1,x2] uzywajac metode trapzow

x = x1:dx:x2;
y = polyval(a,x);

wynik = (y(1) + y(end))./ 2 .* dx + sum(y(2:end-1))*dx;
