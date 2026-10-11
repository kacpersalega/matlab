clc; clear; close all;

x = -2*pi:0.05:2*pi;
y1 = sin(x);
y2 = cos(x);

t = tiledlayout(2,2)
x = 0:pi/100:2*pi;

nexttile
plot(x,cos(x))

nexttile([2 1])
plot(cos(x), sin(x), 'm.-')
axis equal

nexttilea
plot(x,sin(x))

