function f_r = draw_bode(R, L, C, f)
% funkcja rysująca wykresy bodego
w = 2 * pi * f;
s = 1j * w;

Licznik = L .*s + R;
Mianownik = R .* L .* C .* (s.^2) + L .* s + R;

K = Licznik ./ Mianownik;

ampl_dB = 20 * log10(abs(K));
faza_deg = angle(K) * (180 / pi);
[~, idx] = max(ampl_dB);
f_r = f(idx);

t = tiledlayout(2,1);
title(t,"Wykresy Bodego")

nexttile(1);
semilogx(f, ampl_dB);
grid on;
title("Ch-ka ampl. bodego")
xlabel("f")
ylabel("dB")

nexttile(2);
semilogx(f, faza_deg);
grid on;
title("Ch-ka faz. bodego")
xlabel("f")
ylabel("deg")

end
% aby sprawdzic czy dziala to nalezy podac jakies wartosci i za f podac
% logspace(1,5,1000)