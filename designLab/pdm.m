% Automatyczne zwolnienie portów z poprzednich uruchomień
delete(serialportfind);
clear; clc; close all;

% --- KONFIGURACJA ---
PORT = "COM7";          % Twój port COM
BAUD = 921600;
SAMPLES = 512;
FS = 800;              % Częstotliwość próbkowania [Hz]

% Otwarcie portu szeregowego + aktywacja DTR/RTS dla XIAO ESP32-S3
s = serialport(PORT, BAUD);
setDTR(s, true);
setRTS(s, true);
configureTerminator(s, "LF");
flush(s);

% Wektor częstotliwości (rozdzielczość df = 1000/512 = 1.953 Hz na prążek)
freqs = (0:(SAMPLES/2)) * (FS / SAMPLES);
win = hann(SAMPLES)';

% Przygotowanie okna wykresu (ciemny, czytelny motyw)
fig = figure('Name', 'Predictive Maintenance - Widmo Prążkowe FFT', ...
             'Color', [0.12 0.12 0.12], 'Position', [100 100 1050 550]);
ax = axes('Parent', fig, 'Color', [0.18 0.18 0.18], ...
          'XColor', 'w', 'YColor', 'w', 'GridColor', 'w', 'GridAlpha', 0.2);
hold(ax, 'on');

% --- WYBÓR STYLU WYKRESU PRĄŻKOWEGO ---
% Opcja A: Klasyczne prążki ze szpilkami (stem) - domyślnie włączone
hPlot = stem(ax, freqs, zeros(size(freqs)), 'Color', [0 0.9 1], ...
             'Marker', 'o', 'MarkerSize', 3, 'MarkerFaceColor', [0 0.9 1], 'LineWidth', 1.2);

% Opcja B: Jeśli wolisz słupki bez kółek na końcach, zakomentuj 'stem' wyżej i odkomentuj 'bar' niżej:
% hPlot = bar(ax, freqs, zeros(size(freqs)), 0.6, 'FaceColor', [0 0.9 1], 'EdgeColor', 'none');

% Znacznik głównego prążka 1x oraz linie harmonicznych 2x i 3x
hPeak1x = stem(ax, 0, 0, 'Color', [1 0.2 0.2], 'Marker', 'o', ...
               'MarkerSize', 7, 'MarkerFaceColor', [1 0.2 0.2], 'LineWidth', 2.0);
hLine2x = xline(ax, 0, '--', '2x (Luz / Oś)', 'Color', [1 0.6 0], 'LineWidth', 1.5, 'LabelVerticalAlignment', 'top');
hLine3x = xline(ax, 0, ':', '3x Harmoniczna', 'Color', [1 0.2 0.6], 'LineWidth', 1.5, 'LabelVerticalAlignment', 'top');

xlim(ax, [5 400]);      % Pasmo 5 - 400 Hz (ok. 125 wyraźnych prążków na ekranie)
ylim(ax, [0 2.0]);      % Zakres amplitudy [m/s^2] - dopasuj do drgań swojego wentylatora
grid(ax, 'on');
xlabel(ax, 'Częstotliwość [Hz]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'w');
ylabel(ax, 'Amplituda przyspieszenia [m/s^2]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'w');
hTitle = title(ax, 'Oczekiwanie na dane z ESP32...', 'FontSize', 13, 'Color', [0 0.9 1]);
legend(ax, [hPlot, hPeak1x, hLine2x, hLine3x], ...
       {'Prążki widma FFT', '1x (Obroty wału / Niewyważenie)', '2x Harmoniczna', '3x Harmoniczna'}, ...
       'TextColor', 'w', 'Color', [0.15 0.15 0.15], 'EdgeColor', [0.4 0.4 0.4]);

% Główna pętla czasu rzeczywistego
while ishandle(fig)
    if s.NumBytesAvailable > 0
        rawLine = readline(s);
        flush(s, "input"); % Czyszczenie kolejki, aby zachować 0 opóźnienia (real-time)
        
        vals = str2double(split(rawLine, ','));
        if length(vals) == SAMPLES && all(~isnan(vals))
            x = vals' - mean(vals); % Usunięcie składowej stałej (grawitacji)
            
            % Obliczenie FFT
            Y = fft(x .* win);
            P2 = abs(Y / sum(win)) * 2;
            P1 = P2(1:SAMPLES/2+1);
            P1(1:3) = 0; % Wyzerowanie szumu poniżej 4 Hz
            
            % Aktualizacja wysokości wszystkich prążków
            set(hPlot, 'YData', P1);
            
            % Szukanie prążka podstawowego 1x w przedziale 15 - 80 Hz
            idxRange = find(freqs >= 15 & freqs <= 80);
            [amp1x, maxLocalIdx] = max(P1(idxRange));
            f1x = freqs(idxRange(maxLocalIdx));
            
            % Odczyt amplitudy na prążku 2x
            [~, idx2x] = min(abs(freqs - 2*f1x));
            amp2x = P1(idx2x);
            
            if amp1x > 0.05
                % Podświetlenie głównego prążka 1x na czerwono
                set(hPeak1x, 'XData', f1x, 'YData', amp1x);
                hLine2x.Value = 2 * f1x;
                hLine3x.Value = 3 * f1x;
                set(hTitle, 'String', sprintf('1x = %.1f Hz (%.0f RPM)  |  Amp 1x = %.2f m/s^2  |  Amp 2x = %.2f m/s^2', ...
                    f1x, f1x*60, amp1x, amp2x));
            else
                set(hPeak1x, 'XData', 0, 'YData', 0);
                set(hTitle, 'String', 'Wentylator stoi (brak wyraźnego prążka 1x)');
            end
            
            drawnow limitrate;
        end
    end
end

delete(s); clear s;