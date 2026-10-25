function wynik = metoda_prostakotow(a, x1, x2, dx)
% liczy calke oznaczna na przedziale [x1,x2] za pomoca metody prostakotow o
% szerokosci dx
x = x1 : dx : x2-dx;
y = polyval(a, x); 
wynik = sum(y) * dx; 
end