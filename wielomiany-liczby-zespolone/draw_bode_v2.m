function f_r = draw_bode_v2(R, L, C, f)
w = 2 * pi * f;
s = 1j * w;

licznik = R.*L.*C.*(s.^2) + R;
mianownik = R.*L.*C.*(s.^2) + L.*s + R;
K = licznik ./ mianownik;
ampl_dB = 20*log10(abs(K));
faza_deg = angle(K) * (180/pi);
[~, idx] = min(ampl_dB);
f_r = f(idx);

t = tiledlayout(2,1);
title(t, "Wykresy Bodego")

nexttile(1);
semilogx(f, ampl_dB)
title("Wykres amplitudowy Bodego")
xlabel("Częstotliwość [Hz]")
ylabel("Amplituda [dB]")

nexttile(2);
semilogx(f, faza_deg)
title("Wulres częstotliwościowy Bodego")
xlabel("Częstotliwość [Hz]")
ylabel("Faza [stopnie]")

end