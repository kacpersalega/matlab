xA = 0;
xB = 2*pi;
x = linspace(xA, xB, 1000);
x0 = pi/4; % Punkt rozwinięcia szeregu (różny od 0)

N_max = 55;
wektor_N = 1:N_max;
bledy = zeros(1, N_max); 
y_dokladne = sin(x);

for N = 1:N_max
    y_przyblizone = zeros(size(x));

    for n = 0:(N-1)
        % Wyznaczanie n-tej pochodnej z sin(x) w punkcie x0
        % Cykl pochodnych: sin(x) -> cos(x) -> -sin(x) -> -cos(x)
        reszta = mod(n, 4);
        if reszta == 0
            pochodna = sin(x0);
        elseif reszta == 1
            pochodna = cos(x0);
        elseif reszta == 2
            pochodna = -sin(x0);
        else
            pochodna = -cos(x0);
        end

        % Wzór na wyraz ogólny szeregu Taylora wokół x0
        wyraz = (pochodna / factorial(n)) * ((x - x0).^n);
        y_przyblizone = y_przyblizone + wyraz;
    end

    blad_bezwzgledny = abs(y_dokladne - y_przyblizone);
    bledy(N) = max(blad_bezwzgledny);
end

figure;
semilogy(wektor_N, bledy, '-o', 'LineWidth', 2);
xlabel('Liczba wyrazów szeregu (N)');
ylabel('Maksymalny błąd (\epsilon)');
title(['Błąd przybliżenia sin(x) dla szeregu Taylora wokół x_0 = ', num2str(x0)]);
grid on;