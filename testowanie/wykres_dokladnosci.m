xa = 0; 
xb = 1/2; 

% wektor tolerancji
tolerancje = logspace(-1, -12, 12);

% Tablice do przechowywania dokładności 
dokladnosc_bis = zeros(1, length(tolerancje));
dokladnosc_sie = zeros(1, length(tolerancje));
dokladnosc_sty = zeros(1, length(tolerancje));

for i = 1:length(tolerancje)
    d = tolerancje(i);

    % Wywołanie metod
    p_bis = bisekcja(xa, xb, d);
    p_sie = met_siecznych(xa, xb, d);
    p_sty = met_stycznych(xa, xb, d);

    % Obliczenie dokładności (wartość funkcji w miejscu zerowym - im bliżej zera, tym lepiej)
    dokladnosc_bis(i) = abs(badana_funkcja(p_bis));
    dokladnosc_sie(i) = abs(badana_funkcja(p_sie));
    dokladnosc_sty(i) = abs(badana_funkcja(p_sty));
end

% Rysowanie wykresu
figure;
loglog(tolerancje, dokladnosc_bis, '-o', 'LineWidth', 1.5, 'DisplayName', 'Bisekcja');
hold on;
loglog(tolerancje, dokladnosc_sie, '-s', 'LineWidth', 1.5, 'DisplayName', 'Metoda siecznych');
loglog(tolerancje, dokladnosc_sty, '-^', 'LineWidth', 1.5, 'DisplayName', 'Metoda stycznych');

% Odwrócenie osi X
set(gca, 'XDir', 'reverse');

% Opisy osi 
xlabel('Zadana tolerancja (d)');
ylabel('Błąd');
title('Porównanie dokładności metod numerycznych');
legend('Location', 'best');
grid on;