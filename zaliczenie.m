% =========================================================================
% KALKULATOR OCENY Z TECHNIK OBLICZENIOWYCH
% =========================================================================
clear; clc;

% -------------------------------------------------------------------------
% 1. PARAMETRY SEMESTRU (według regulaminu)
% -------------------------------------------------------------------------
% Zakładamy maksymalnie 14 spotkań
max_spotkan_aktywnosci = 13;
max_spotkan_kartkowki = 12;

% Maksymalne punkty do zdobycia w całym semestrze
K_max_total = 1 + (max_spotkan_kartkowki - 1) * 4; % 1 pkt (zajęcia org.) + 13 * 4 pkt
A_max_total = max_spotkan_aktywnosci * 4;           % 14 spotkań * 4 pkt
C_max_total = 40; % Przykładowa maksymalna pula z kolokwiów (zmień jeśli prowadzący poda inną wartość)

% Wagi procentowe
waga_K = 30;
waga_A = 40;
waga_C = 30;

% -------------------------------------------------------------------------
% 2. TWOJE WYNIKI (Aktualizuj te zmienne po każdych zajęciach)
% -------------------------------------------------------------------------
K_moje = 1;         % Suma zdobytych przez Ciebie punktów z kartkówek
A_moje = 8;         % Suma zdobytych przez Ciebie punktów za aktywność
C_moje = 0;          % Suma zdobytych punktów z kolokwiów
nieobecnosci = 0;    % Twoja liczba nieobecności

% Informacja o tym, ile punktów było łącznie do zdobycia DO TEJ PORY
% (Pozwala to oszacować Twoją "bieżącą formę", wykluczając to, czego jeszcze nie było)
K_max_dotychczas = 1 + 0 * 4; % np. minęło 6 zajęć (1 org + 5 zwykłych)
A_max_dotychczas = 2 * 4;     % np. minęło 6 zajęć
C_max_dotychczas = 1;         % np. jeszcze nie było kolokwium

% -------------------------------------------------------------------------
% 3. OBLICZENIA
% -------------------------------------------------------------------------

% A) Wynik z całego semestru (ile % z końcowej oceny już masz w kieszeni)
proc_K_total = (K_moje / K_max_total) * waga_K;
proc_A_total = (A_moje / A_max_total) * waga_A;
proc_C_total = (C_moje / C_max_total) * waga_C;
wynik_calkowity_procent = proc_K_total + proc_A_total + proc_C_total;

% B) Wynik z dotychczasowego materiału (Twoja bieżąca skuteczność)
waga_K_dotychczas = (K_max_dotychczas / K_max_total) * waga_K;
waga_A_dotychczas = (A_max_dotychczas / A_max_total) * waga_A;
waga_C_dotychczas = (C_max_dotychczas / C_max_total) * waga_C;

waga_suma_dotychczas = waga_K_dotychczas + waga_A_dotychczas + waga_C_dotychczas;

if waga_suma_dotychczas > 0
    skutecznosc_biezaca = ((K_moje / K_max_dotychczas) * waga_K_dotychczas + ...
                           (A_moje / A_max_dotychczas) * waga_A_dotychczas + ...
                           (C_moje / C_max_dotychczas) * waga_C_dotychczas) ...
                           / waga_suma_dotychczas * 100;
else
    skutecznosc_biezaca = 0;
end

% Wyliczenie przewidywanej oceny z samej bieżącej skuteczności
if skutecznosc_biezaca >= 90
    ocena_biezaca = '5.0 (bdb)';
elseif skutecznosc_biezaca >= 80
    ocena_biezaca = '4.5 (+db)';
elseif skutecznosc_biezaca >= 70
    ocena_biezaca = '4.0 (db)';
elseif skutecznosc_biezaca >= 60
    ocena_biezaca = '3.5 (+dst)';
elseif skutecznosc_biezaca >= 50
    ocena_biezaca = '3.0 (dst)';
else
    ocena_biezaca = '2.0 (ndst) - Poniżej progu zaliczenia';
end

% C) Ile brakuje do zaliczenia (50%)
brakuje_procent = max(0, 50 - wynik_calkowity_procent);

% -------------------------------------------------------------------------
% 4. WYŚWIETLANIE WYNIKÓW
% -------------------------------------------------------------------------
fprintf('\n================ RAPORT ZALICZENIOWY ================\n');

% Sprawdzanie nieobecności
if nieobecnosci > 5
    fprintf('!!! UWAGA: Masz %d nieobecności. Zgodnie z regulaminem (pkt 9) NIE UZYSKUJESZ ZALICZENIA.\n', nieobecnosci);
elseif nieobecnosci > 2
    fprintf('! OSTRZEŻENIE: Masz %d nieobecności (powyżej 20%%). Dopuszczenie do zaliczenia zależy od decyzji prowadzącego (pkt 7).\n', nieobecnosci);
else
    fprintf('Nieobecności: %d (w normie).\n', nieobecnosci);
end

fprintf('-----------------------------------------------------\n');
fprintf('Twoja skuteczność na zajęciach do tej pory: %.2f%%\n', skutecznosc_biezaca);
fprintf('Gdyby semestr skończył się teraz, Twoja ocena to: %s\n', ocena_biezaca);
fprintf('-----------------------------------------------------\n');
fprintf('Zgromadzone punkty w stosunku do CAŁEGO semestru:\n');
fprintf(' - Kartkówki:  %.2f%% / 30.00%%\n', proc_K_total);
fprintf(' - Aktywność:  %.2f%% / 40.00%%\n', proc_A_total);
fprintf(' - Kolokwia:   %.2f%% / 30.00%%\n', proc_C_total);
fprintf('=====================================================\n');
fprintf('SUMA Z CAŁEGO SEMESTRU: %.2f%% / 100.00%%\n', wynik_calkowity_procent);

if brakuje_procent > 0
    fprintf('Do minimalnego progu zaliczenia (50%%) brakuje Ci: %.2f%%\n', brakuje_procent);
else
    fprintf('GRATULACJE! Masz już zagwarantowane minimum zaliczeniowe (50%%)!\n');
    
    % Sprawdzanie kolejnych progów
    progi = [60, 70, 80, 90];
    oceny = {'3.5', '4.0', '4.5', '5.0'};
    for i = 1:length(progi)
        if wynik_calkowity_procent < progi(i)
            fprintf('Do oceny %s brakuje Ci: %.2f%%\n', oceny{i}, progi(i) - wynik_calkowity_procent);
            break;
        end
    end
end
fprintf('=====================================================\n');