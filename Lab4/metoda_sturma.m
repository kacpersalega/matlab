function K = sturm_method(p, xa, xb)
% p  - wektor współczynników wielomianu (np. [1, 0, -2] dla x^2 - 2)
% xa - początek przedziału
% xb - koniec przedziału

%% 1. Generowanie ciągu Sturma[cite: 1]
% Używamy tablicy komórkowej (cell array) do przechowywania wielomianów
% o różnych stopniach.
P = {};

% f(x)
P{1} = trim_poly(p); 

% f'(x)
P{2} = trim_poly(polyder(P{1})); 

k = 3;
% Pętla działa dopóki ostatni wyznaczony wielomian nie jest stałą (stopień > 0)
while length(P{k-1}) > 1
    % Dzielenie wielomianów: P{k-2} / P{k-1}. 
    % Funkcja deconv zwraca iloraz (q) i resztę (rem).
    [~, rem] = deconv(P{k-2}, P{k-1});

    % f_k(x) = (-1) * R( f_{k-2}(x) / f_{k-1}(x) )[cite: 1]
    P{k} = trim_poly(-rem);

    k = k + 1;
end

%% 2. Ewaluacja ciągu w punktach xa i xb[cite: 2]
num_polys = length(P);
va = zeros(1, num_polys);
vb = zeros(1, num_polys);

for i = 1:num_polys
    va(i) = polyval(P{i}, xa);
    vb(i) = polyval(P{i}, xb);
end

%% 3. Zliczanie zmian znaków (Z_a i Z_b)
Za = count_sign_changes(va);
Zb = count_sign_changes(vb);

%% 4. Obliczenie liczby pierwiastków[cite: 2]
K = Za - Zb;

% Opcjonalne wyświetlanie wyników w konsoli
fprintf('Zmiany znaków w xa = %g: Za = %d\n', xa, Za);
fprintf('Zmiany znaków w xb = %g: Zb = %d\n', xb, Zb);
fprintf('Liczba pierwiastków rzeczywistych w (%g, %g): K = %d\n', xa, xb, K);
end

% --- Funkcje pomocnicze ---

function z = count_sign_changes(v)
% Funkcja zliczająca zmiany znaków w ciągu

tol = 1e-10; % Tolerancja dla zera (błędy numeryczne zmiennoprzecinkowe)

% "zerowe wartości pomijamy"[cite: 2]
v(abs(v) < tol) = []; 

if isempty(v) || length(v) == 1
    z = 0;
    return;
end

% Pobranie samych znaków (1 dla dodatnich, -1 dla ujemnych)
s = sign(v);

% Zliczenie miejsc, gdzie znak obecny różni się od następnego
z = sum(s(1:end-1) ~= s(2:end));
end

function pt = trim_poly(p)
% Funkcja usuwająca wiodące zera z wektora wielomianu.
% Jest to krytyczne dla funkcji deconv, która przy błędach 
% numerycznych zostawia np. 1e-15 na początku wektora reszty.

tol = 1e-10;
idx = find(abs(p) > tol, 1, 'first');

if isempty(idx)
    pt = 0; % Jeśli wszystko jest zerem, zwracamy skalar 0
else
    pt = p(idx:end);
end
end