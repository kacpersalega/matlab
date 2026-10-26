% Zdefiniowanie przedziału i punktu rozwinięcia
x = linspace(0, 2*pi, 100);
x0 = pi/4; % Nowy punkt wokół którego rozwijamy szereg

y_dokladne = sin(x);
y_przyblizone = zeros(size(x));
N = 10; % Liczba wyrazów

% Główna pętla obliczeniowa dla szeregu Taylora
for n = 0:(N-1)
    % Obliczanie wartości n-tej pochodnej w punkcie x0
    pochodna = sin(x0 + n * pi/2);

    % Pełny wzór Taylora (zauważ (x - x0).^n zamiast x.^n)
    wyraz = (pochodna / factorial(n)) * (x - x0).^n;

    % Dodawanie wyrazu do sumy
    y_przyblizone = y_przyblizone + wyraz;
end

% Rysowanie wyniku dla porównania
figure;
plot(x, y_dokladne, 'b-', 'LineWidth', 2); hold on;
plot(x, y_przyblizone, 'r--', 'LineWidth', 2);
plot(x0, sin(x0), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Punkt x0
legend('Dokładny sin(x)', 'Przybliżenie Taylora', 'Punkt rozwinięcia x_0');
title('Szereg Taylora wokół punktu x_0 \neq 0');
grid on;