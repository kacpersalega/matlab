function c = metoda_bisekcji(h, w)
% ta funkcja bedzie obliczala miejsce zerowe na przedziale h z dokladnoscia
% w

% Przygotowanie zmiennych
a = h(1);
b = h(2);
tol = w;

while ((b - a) / 2) > tol
    
    c = (a + b) / 2;
    
    if badana_funkcja(c) == 0
        break;
    end

    if badana_funkcja(a) * badana_funkcja(c) < 0
        b = c; % miejce zerowe lezy w lewej polowie [a,c]
    else
        a = c; % miejsce zerowe lezy w prawej polowie [c,b]
    end
end

if badana_funkcja(c) ~= 0
    c = (a + b) / 2;
end

disp("Znalezione miejsce zerowe:")
disp(c);
disp("Wartość f(c):")
disp(badana_funkcja(c));

end

function y = badana_funkcja(x)
    y = x^3 - 2*x - 5;
end


