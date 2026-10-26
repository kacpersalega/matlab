% Definicja dowolnego kąta
phi = pi/4; 

% Lewa i Prawa strona wzoru Eulera
L = exp(1i * phi);
P = cos(phi) + 1i * sin(phi);

% 1. L =? P (Naiwne sprawdzenie - może zwrócić 0 / false)
sprawdzenie_bezposrednie = (L == P);

% 2. kryt. błędu => liczba (Poprawne sprawdzenie z tolerancją)
liczba = 1e-10; % nasze kryterium błędu
sprawdzenie_z_bledem = abs(L - P) < liczba;

disp(sprawdzenie_z_bledem); % Wyświetli 1 (true)