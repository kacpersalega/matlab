function p = met_siecznych(xa, xb, d)

x1 = xa;
x2 = xb;
tol = d;

blad_przyblizenia = 100;

while blad_przyblizenia > tol
    f1 = badana_funkcja(x1);
    f2 = badana_funkcja(x2);

    if (f2 - f1) == 0
        disp("Blad dzielenie przez zero");
        break
    end

    x3 = x2 - (f2 * (x2 - x1))/(f2 - f1);

    blad_przyblizenia = abs(x3 - x2);

    x1 = x2;
    x2 = x3;

end

p = x2;
disp("Znalezione miejsce zerowe:")
disp(p);
disp("wartość f(p):")
disp(badana_funkcja(p))