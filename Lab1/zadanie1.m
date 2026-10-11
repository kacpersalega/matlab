function zadanie1(A, B, a, b, xa, xb)
% funkcja ta rysuje jakąś śmieszną funkcje matematyczną
x = xa:0.001:xb;

y = A .* (exp(-B.*x)) .* sin(2 .* pi .* a .* x) .* cos(2 .* pi .* b .* x);

figure(1);
clf;
hold on;
plot(x, y);
grid on;
title("plot");
xlabel("X");
ylabel("Y");
