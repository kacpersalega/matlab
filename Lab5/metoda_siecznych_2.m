function x_zero = metoda_siecznych_2(h,w)
% h - przedzial 
% w - tolerancja

x1 = h(1);
x2 = h(2);
tol = w;

% Zmienna do kontrolowania pętli (sztuczny błąd początkowy)
blad_przyblizenia = 100;

while blad_przyblizenia > tol
    f1 = badana_funkcja(x1);
    f2 = badana_funkcja(x2);
    
    if (f2 - f1) == 0
        disp('Błąd: f(x2) = f(x1), dzielenie przez zero.');
        break;
    end
    
    x3 = x2 - (f2 * (x2 - x1)) / (f2 - f1);

    blad_przyblizenia = abs(x3 - x2);
    
    x1 = x2;
    x2 = x3;
end

x_zero = x2;
disp("Znalezione miejsce zerowe:")
disp(x_zero);
disp("Wartość f(x):")
disp(badana_funkcja(x_zero));

end

function y = badana_funkcja(x)
    y = x^2 -x -2;
end
