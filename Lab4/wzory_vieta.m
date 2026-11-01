function wspolczynniki = wzory_vieta(pierwiastki)
% pierwiastki - wektor zawierający miejsca zerowe [x1, x2, ..., xn]

n = length(pierwiastki);
wspolczynniki = zeros(1, n + 1);

% 1. Najwyższy współczynnik a_n zawsze wynosi 1 (postać znormalizowana)
wspolczynniki(1) = 1;

for k = 1:n
    kombinacje = nchoosek(pierwiastki, k);
    iloczyny = prod(kombinacje, 2);
    wspolczynniki(k + 1) = ((-1)^k) * sum(iloczyny);
end

end