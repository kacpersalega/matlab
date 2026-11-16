function p = bisekcja(xa, xb, d)

a = xa;
b = xb;
tol = d;

while ((b - a)/2) > tol
    c = (a + b) /2;

    if badana_funkcja(c) == 0
        break
    end

    if badana_funkcja(a) * badana_funkcja(c) < 0 % zmienil sie znak
        b = c;
    elseif badana_funkcja(b) * badana_funkcja(c) < 0
        a = c;
    end
end

if badana_funkcja(c) ~= 0
    p = (a + b) /2;
end

format long
disp("Znalezione miejsce zerowe:")
disp(p);
disp("Wartość f(p):")
disp(badana_funkcja(p));
disp("Wykonano tyle iteracji: ");
disp(licznik_iteracji);