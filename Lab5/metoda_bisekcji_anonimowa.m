function c = metoda_bisekcji_anonimowa(fun, h, w)

% Przygotowanie zmiennych
a = h(1);
b = h(2);
tol = w;

while ((b - a) / 2) > tol

    c = (a + b) / 2;

    if fun(c) == 0
        break;
    end

    if fun(a) * fun(c) < 0
        b = c; % miejce zerowe lezy w lewej polowie [a,c]
    else
        a = c; % miejsce zerowe lezy w prawej polowie [c,b]
    end
end

if fun(c) ~= 0
    c = (a + b) / 2;
end
end