xA =  0;
xB = 2*pi;
x = linspace(xA, xB, 1000);

N_max = 35;
wektor_N = 1:N_max;
bledy = zeros(1, N_max);

y_dokladne = cos(x);

for N = 1:N_max
    y_przyblizone = zeros(size(x));
    for n = 0:(N-1)
        wyraz = ((-1)^n) / factorial(2*n) * (x.^(2*n))
        y_przyblizone = y_przyblizone + wyraz;
    end

    blad_bezwzgledny = abs(y_przyblizone - y_dokladne);
    bledy(N) = max(blad_bezwzgledny);
end

figure;
semilogy(wektor_N, bledy ,'-o');
grid on;