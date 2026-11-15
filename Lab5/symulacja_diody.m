R1 = 1e3;             % Rezystancja [Ohm]
Is = 1e-12;           % Prąd nasycenia diody [A]
Ut = 0.0258;          % Napięcie termiczne [V]

U1 = 0:0.01:5;        % Wektor napięcia narastającego od 0 do 5V ze skokiem 0.01V
ID = zeros(size(U1)); % Przygotowanie pustego wektora na wyniki

for k = 1:length(U1)
    Uk = U1(k);

    f_dioda = @(I) I - Is * (exp((Uk - I * R1) / Ut) - 1);

    ID(k) = metoda_bisekcji_anonimowa(f_dioda, [0, Uk/R1 + 1e-6], 1e-8); 
end


figure();
plot(U1, ID * 1000, 'b-', 'LineWidth', 2);
grid on;
title('Prąd w układzie rezystor - dioda', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Napięcie wymuszenia U_1 [V]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Prąd diody I_D [mA]', 'FontSize', 12, 'FontWeight', 'bold');
xlim([0 max(U1)]); % Oś X od 0 do 5V
ylim([0 max(ID * 1000) + 0.5]); % Oś Y od 0 do ma