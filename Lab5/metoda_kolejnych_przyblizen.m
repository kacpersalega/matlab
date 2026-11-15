function x_zero = metoda_kolejnych_przyblizen(x0, w)
% x0 - punkt startowy
% w - tolerancja

tol = w;

blad_przyblizenia = 100;
licznik_iteracji = 0;

while blad_przyblizenia > tol;

    x1 = funkcja_lambda(x0);

    blad_przyblizenia = abs(x1 - x0);

    x0 = x1;
    licznik_iteracji = licznik_iteracji + 1;
end
x_zero = x0;

disp("Znalezione miejsce zerowe:")
disp(x_zero);
disp("Wartość f(x):");
disp(badana_funkcja(x_zero))
end

function y = badana_funkcja(x)
    y = x^2 - x - 2; 
end

function y = funkcja_lambda(x)
    y = sqrt(x + 2);
end
