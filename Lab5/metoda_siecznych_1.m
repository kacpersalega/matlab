function x_zero = metoda_siecznych_1(h, w)
% h - wektor przedziału [a, b], np. [1, 3]
% w - zadana dokładność (tolerancja błędu), np. 0.001

a = h(1);
b = h(2);
tol = w;

% Przygotowanie - blad_przyblizenia inicjalnie bardzo duzy zeby sie
% uruchomilo
x1_poprzednie = a; 
blad_przyblizenia = 100; 

while blad_przyblizenia > tol

    fa = badana_funkcja(a);
    fb = badana_funkcja(b);

    % WZÓR NA KANDYDATA Z METODY SIECZNYCH I 
    x1 = b - (fb * (b - a)) / (fb - fa);
    f1 = badana_funkcja(x1);

    % Jeśli trafiono idealnie w zero
    if f1 == 0
        break;
    end

    if fa * f1 < 0
        b = x1;  % Miejsce zerowe jest w przedziale (a, x1)
    else
        a = x1;  % Miejsce zerowe jest w przedziale (x1, b)
    end

    blad_przyblizenia = abs(x1 - x1_poprzednie);
    x1_poprzednie = x1;
end

x_zero = x1;

disp("Znalezione miejsce zerowe:")
disp(x_zero);
disp("Wartość f(c):")
disp(badana_funkcja(x_zero));

end

function y = badana_funkcja(x)
    y = x^2 - x - 2;
end