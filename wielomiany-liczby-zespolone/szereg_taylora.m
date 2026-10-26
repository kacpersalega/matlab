% 1. Przygotowanie danych
x = linspace(-2*pi, 2*pi, 200); % Oś X od -2pi do 2pi (200 punktów)
y_oryginalna = sin(x);          % Oryginalna funkcja

% 2. Tworzenie i formatowanie głównego wykresu
figure;
plot(x, y_oryginalna, 'k-', 'LineWidth', 2.5); % Rysowanie grubą czarną linią
hold on;                                       % Zatrzymanie wykresu, by dodać kolejne linie
grid on;                                       % Włączenie siatki
ylim([-2, 2]);                                 % Ograniczenie osi Y dla lepszej czytelności

% 3. Definicja rzędów przybliżenia (ile wyrazów szeregu bierzemy)
% Dla sin(x) bierzemy pod uwagę k=0, 1, 2, 3 (co odpowiada potęgom 1, 3, 5, 7)
wartosci_k = [0, 1, 2, 3]; 
kolory = ['r', 'g', 'b', 'm']; % Kolory dla kolejnych linii
tekst_legendy = {'Oryginalny sin(x)'};

% 4. Pętla rysująca kolejne przybliżenia
for i = 1:length(wartosci_k)
    n = wartosci_k(i);
    y_przyblizenie = zeros(1, length(x));
    
    % Sumowanie wielomianu Taylora do n-tego wyrazu
    for k = 0:n
        % Uwaga na operacje tablicowe: .^ zamiast ^
        wyraz = ((-1)^k .* x.^(2*k + 1)) ./ factorial(2*k + 1); 
        y_przyblizenie = y_przyblizenie + wyraz;
    end
    
    % Dodanie linii przybliżenia do wykresu
    plot(x, y_przyblizenie, 'Color', kolory(i), 'LineWidth', 1.5, 'LineStyle', '--');
    
    % Dodanie opisu do legendy (potęga 2n+1)
    tekst_legendy{end+1} = sprintf('Przybliżenie do x^{%d}', 2*n+1);
end

% 5. Upiększanie wykresu
title('Przybliżenie funkcji sin(x) szeregiem Taylora', 'FontSize', 14);
xlabel('Oś X', 'FontSize', 12);
ylabel('Wartość f(x)', 'FontSize', 12);
legend(tekst_legendy, 'Location', 'southoutside', 'NumColumns', 3);