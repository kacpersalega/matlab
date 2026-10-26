% Ten plik porownuje uzycie atan, atan2 oraz angle

theta_true = linspace(-pi,pi, 1000);

x = cos(theta_true); 
y = sin(theta_true);

z = x + 1j*y;

atan_phase = atan(y ./ x);
atan2_phase = atan2(y,x);
angle_phase = angle(z);

figure(1);
clf;
hold on;
plot(theta_true, theta_true, 'y-');
plot(theta_true, atan_phase, 'r-');
plot(theta_true, atan2_phase, 'g--');
plot(theta_true, angle_phase, 'b-.');

ax = gca;
ax.XTick = -pi:pi/2:pi;
ax.XTickLabel = ({ '-\pi', '-\pi/2', '0', '\pi/2', '\pi'})
ax.YTick = -pi:pi/2:pi;
ax.YTickLabel = ({ '-\pi', '-\pi/2', '0', '\pi/2', '\pi'})

grid on;
legend('reference','atan', 'atan2', 'angle');
xlim([-pi pi])
ylim([-pi pi])
xlabel("Angle Value");
ylabel("Computed Angle");
title("Comparison of atan atan2 & angle")