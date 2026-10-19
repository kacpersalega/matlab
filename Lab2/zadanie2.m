x = linspace(0, 2*pi, 10000);

L = exp(1i * x);
P = cos(x) + 1i * sin(x);

blad = abs(L - P);
maksymalny_blad = max(blad);

disp('Maksymalny błąd numeryczny wzoru Eulera wynosi:');
disp(maksymalny_blad);