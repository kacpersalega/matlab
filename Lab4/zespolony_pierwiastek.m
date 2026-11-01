function x = zespolony_pierwiastek(c,n)
% x = zespolony_pierwiastek
% Dane wejściowe:
%   c - liczba do spierwiastkowania
%   n - stopień pierwiastka
% Dane wyjściowe:
%   x - wartości pierwiastka

a = abs(c);
phi = angle(c);
k = 0:n-1; 
x = a^(1/n) * exp(j*(2*pi*k+phi)/n);