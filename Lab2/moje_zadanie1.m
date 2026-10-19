clear; close all; clc; clf;
true_phase = linspace(-pi,pi,1000); % tworzymy 1000 kątów

x = cos(true_phase);
y = sin(true_phase);

z = x + 1j*y;

atan_phase = atan(y ./ x);
atan2_phase = atan2(y,x);
angle_phase = angle(z);

figure(1); 
hold on;
plot(true_phase, true_phase, 'k-'); % rysuje poprawny kat jako linie prosta o slope = 1
plot(true_phase, atan_phase, 'r');
plot(true_phase, atan2_phase, 'b--');
plot(true_phase, angle_phase, 'g:');

ax = gca;
ax.XTick = -pi:pi/2:pi;
ax.XTickLabel = {'-\pi', '-\pi/2', '0', '\pi/2', '\pi'};
ax.YTick = -pi:pi/2:pi;
ax.YTickLabel = {'-\pi', '-\pi/2', '0', '\pi/2', '\pi'};

xlim([-pi pi]);
ylim([-pi pi]);
grid on;
legend('Kąt rzeczywisty', 'atan', 'atan2', 'angle');
xlabel('Kąt rzeczywisty \theta [rad]');
ylabel('Obliczona faza [rad]');
title('Porównanie funkcji atan, atan2 i angle dla fazy liczby zespolonej');
