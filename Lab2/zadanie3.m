T = 3;                  
A = 5;                  
N = 50000;               

x = linspace(0, 3*T, 1000);
f = zeros(size(x));

for n = 0:N
    if n == 0
        A_n = A / 2;
    else
        A_n = A * (sin(pi * n/4) / (pi * n/4));
    end
    phi_n = -(3/4) * pi * n;
    f = f + A_n * cos(2 * pi * (n / T) * x + phi_n);
end

figure;
plot(x, f, 'g-', 'LineWidth', 1.5);
grid on;
title(['Wykres szeregu trygonometrycznego (N = ', num2str(N), ')']);
xlabel('x');
ylabel('f(x)');