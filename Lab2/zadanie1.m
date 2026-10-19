% Definiowanie wektora rzeczywistego kąta theta (od -pi do pi)
theta_true = linspace(-pi, pi, 1000);

% Generowanie współrzędnych punktów na okręgu jednostkowym
x = cos(theta_true);
y = sin(theta_true);

% Tworzenie wektora liczb zespolonych
z = x + 1j * y;

% Obliczanie fazy trzema różnymi metodami
faza_atan = atan(y ./ x);
faza_atan2 = atan2(y, x);
faza_angle = angle(z);

% Tworzenie wykresu
figure;
plot(theta_true, theta_true, 'k-', 'LineWidth', 3); hold on;
plot(theta_true, faza_atan, 'r-', 'LineWidth', 2);
plot(theta_true, faza_atan2, 'b--', 'LineWidth', 2);
plot(theta_true, faza_angle, 'g:', 'LineWidth', 2.5);

% Formatowanie wykresu
grid on;
ax = gca;
ax.XTick = -pi:pi/2:pi;
ax.XTickLabel = {'-\pi', '-\pi/2', '0', '\pi/2', '\pi'};
ax.YTick = -pi:pi/2:pi;
ax.YTickLabel = {'-\pi', '-\pi/2', '0', '\pi/2', '\pi'};

legend('Kąt rzeczywisty', 'atan(y/x)', 'atan2(y,x)', 'angle(z)');
xlabel('Kąt rzeczywisty \theta [rad]');
ylabel('Obliczona faza [rad]');
title('Porównanie funkcji atan, atan2 i angle dla fazy liczby zespolonej');
xlim([-pi, pi]);
ylim([-pi, pi]);