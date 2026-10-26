function y = moj_polyval(p, x)
% moj_polyval Oblicza wartość wielomianu dla zadanych argumentów.
% p - wektor współczynników wielomianu (od najwyższej potęgi)
% x - wartość (lub macierz/wektor wartości), dla których liczymy wielomian

% Inicjalizacja wektora wynikowego zerami w rozmiarze x
y = zeros(size(x));

% Iteracja po wszystkich współczynnikach wielomianu
for i = 1:length(p)
    y = y .* x + p(i);
end
end