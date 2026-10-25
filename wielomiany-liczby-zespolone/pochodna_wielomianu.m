function b = pochodna_wielomianu(a)
% pochodna wielomianu o wspolczynnikach a

a = a(:).'; % upewnienie sie ze wektor a jest wierszowy
n = length(a) - 1; % stopien wielomianu
b = (n:-1:1) .* a(1:end-1);
end