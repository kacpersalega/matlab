function p = met_stycznych(xa, xb, d)

a = xa;
b = xb;
tol = d;

% wybór optymalnego punktu startowego
if badana_funkcja(a) * druga_pochodna(a) > 0
    x0 = a;
else 
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

p = x0;
%disp("Znalezione miejsce zerowe:");
%disp(p);
%disp("wartość f(p):");
%disp(badana_funkcja(p));
