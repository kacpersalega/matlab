clc; clear; close all;
x = 0:0.001:2;

N = 5; % liczba probek

A = 0.5 + (2 - 0.5) * rand(1, N);
fn = 1 + (10 - 1) * rand(1, N);
phase = rand(1, N) * 2*pi;

size(x)

f = zeros(size(x));

for n = 1:N
    temp = A(n) * cos(2*pi * fn(n) * x + phase(n));
    f = f + temp;
end

[f_max, idx_max] = max(f)
x_max = x(idx_max);

figure(1); hold on; grid on;
plot(x,f, 'r-');
title("TITLE");
xlabel("x");
ylabel("y");
plot(x_max, f_max, 'bo')
hold off;