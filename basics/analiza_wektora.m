function [srednia, maksimum, indeks_max] = analiza_wektora(v)
% funkcja zwraca wektor wierszowy 3 elementowy, 1 element to srednia
% wektora drugi element to maksimum wektora a 3 element to najwiekszy
% indeks 

srednia = sum(v) / length(v);
[maksimum, indeks_max] = max(v);

end