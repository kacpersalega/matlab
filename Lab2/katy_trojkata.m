
A = rand(1, 2);
B = rand(1, 2);
C = rand(1, 2);

AB = B - A;
AC = C - A;

BA = A - B;
BC = C - B;

CA = A - C;
CB = B - C;

kat_A = acos(dot(AB, AC) / (norm(AB) * norm(AC)));
kat_B = acos(dot(BA, BC) / (norm(BA) * norm(BC)));
kat_C = acos(dot(CA, CB) / (norm(CA) * norm(CB)));

kat_A_deg = rad2deg(kat_A);
kat_B_deg = rad2deg(kat_B);
kat_C_deg = rad2deg(kat_C);

suma_katow = kat_A_deg + kat_B_deg + kat_C_deg;

fprintf('Kąt A: %.2f°\n', kat_A_deg);
fprintf('Kąt B: %.2f°\n', kat_B_deg);
fprintf('Kąt C: %.2f°\n', kat_C_deg);
fprintf('Suma kątów: %.15f°\n', suma_katow);