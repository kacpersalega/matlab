function x_zero = metoda_newtona(h, w)

a = h(1);
b = h(2);
tol = w;

% wybor optymalnego punktu startowego
if badana_funkcja(a) * druga_pochodna(a) > 0
    x0 = a;
elseif badana_funkcja(b) * druga_pochodna(b) > 0
    x0 = b;
end

blad_przyblizenia = 100;

while blad_przyblizenia > tol
    
    f0 = badana_funkcja(x0);
    df0 = pierwsza_pochodna(x0);

    if df0 == 0
        break
    end

    x1 = x0 - (f0 / df0);

    blad_przyblizenia = abs(x1 - x0);

    x0 = x1;
end

x_zero = x0;
disp("Znalezione miejsce zerowe:")
disp(x_zero);
disp("Wartość f(x):")
disp(badana_funkcja(x_zero));
end

% tutaj funkcja badana i jej pochodne

function y = badana_funkcja(x)
    y = x^2 - x - 2;
end

function y = pierwsza_pochodna(x)
    y = 2*x -1;
end

function y = druga_pochodna(x)
    y = 2;
end
