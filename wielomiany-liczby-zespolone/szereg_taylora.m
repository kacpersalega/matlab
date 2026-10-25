% 1. Wybieramy punkt 'x', dla którego chcemy policzyć wynik (np. x = 2)
x = 2; 

% 2. Ustalamy ile wyrazów szeregu chcemy zsumować (to górne 'n' nad Sigmą ze slajdu 1)
% Im większe n, tym dokładniejszy wynik.
n = 10; 

% 3. Zmienna, do której będziemy "zbierać" naszą sumę
przyblizenie_taylora = 0; 

% 4. Pętla 'for' zastępuje matematyczny symbol sumy (Sigma od k=0 do n)
for k = 0:n
    % Obliczamy pojedynczy ułamek ze wzoru: x^k / k!
    % Zgodnie ze slajdem 1, do k! używamy wbudowanej funkcji factorial()
    pojedynczy_wyraz = (x^k) / factorial(k);

    % Dodajemy ten ułamek do całkowitej sumy
    przyblizenie_taylora = przyblizenie_taylora + pojedynczy_wyraz;
end

% 5. Wyświetlamy i porównujemy wyniki w oknie Command Window
disp(['Nasze przybliżenie Taylora dla e^2: ', num2str(przyblizenie_taylora)]);
disp(['Dokładny wynik z funkcji wbudowanej exp(2): ', num2str(exp(x))]);