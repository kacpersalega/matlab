% plik w ktorym bede wywolywac inne funkcje ktore zrobie

clc; clear;

v = rand(1,25) * 10;
srednia_tylko = analiza_wektora(v)

[~, ~, maks_indeks_tylko] = analiza_wektora(v)
[~, maks_tylko, ~] = analiza_wektora(v)