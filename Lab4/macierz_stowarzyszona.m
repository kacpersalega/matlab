function r = macierz_stowarzyszona(m)
% m - wektor współczynników wielomianu [an, an-1, ..., a1, a0]

stopien = length(m) - 1;

m = m / m(1); %normalizacja

A = zeros(stopien, stopien);
A(1, :) = -m(2:end); % wypełnienie pierwszego wiersza macierzy A wsp.

if stopien > 1
    A(2:end, 1:end-1) = eye(stopien - 1);
end

% miejsac zerowe == wartości własne macierzy stowarzyszonej
r = eig(A);
end