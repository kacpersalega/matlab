% Parametry do obliczeń
x = 2.0; % Przykładowy argument, dla którego liczymy cosh(x)
max_czlonow = 15;

% Wartość referencyjna z wbudowanej funkcji
wartosc_referencyjna = cosh(x);

liczby_czlonow = 1:max_czlonow;
bledy = zeros(1, max_czlonow); % Prealokacja tablicy na błędy

% Obliczanie błędu dla różnej liczby członów
for i = 1:max_czlonow
    n = liczby_czlonow(i);
    wartosc_przyblizona = cosh_szereg(x, n);
    
    % Kryterium błędu bezwzględnego
    bledy(i) = abs(wartosc_przyblizona - wartosc_referencyjna);
end

% Generowanie wykresu
figure;
semilogy(liczby_czlonow, bledy, '-ob', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('Liczba członów szeregu potęgowego');
ylabel('Błąd bezwzględny (skala logarytmiczna)');
title(sprintf('Błąd przybliżenia funkcji cosh(x) dla x = %.1f', x));
grid on;
xticks(liczby_czlonow);

% ---------------------------------------------------------
% Definicja funkcji wyznaczającej cosh(x) z szeregu Taylora
% ---------------------------------------------------------
function suma = cosh_szereg(x, liczba_czlonow)
    suma = 0.0;
    wyraz = 1.0; % Pierwszy wyraz dla n=0
    
    for n = 0:(liczba_czlonow - 1)
        suma = suma + wyraz;
        % Obliczenie kolejnego wyrazu na podstawie poprzedniego
        % mnożąc przez x^2 / ((2n+1)*(2n+2))
        wyraz = wyraz * (x^2) / ((2 * n + 1) * (2 * n + 2));
    end
end