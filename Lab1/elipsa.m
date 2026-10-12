function elipsa(x, y, R, r)
% this function draws an elipse at origin x,y with given radius
% R - półoś wielka
% r - półoś mała

t = 0:0.001:2*pi;

X = x + R*cos(t); % x - shift left-right
Y = y + r*sin(t); % y - shift up-down;

figure(1);
clf;
plot(X,Y,'g-');
title("Elipsa")
xlabel("X")
ylabel("Y")
grid on;
xlim([-10 10])
ylim([-10 10])