clc; clear; close all;

f1 = 30; % freq
ampl1 = 0.5;
fs = 1600; % sampling frequency
N = 2 * fs; % samples
t = 1; % seconds
x = 0:1/fs:t;

signal = ampl1 .* sin(2 .* pi .* f1 .* x);
plot(x,signal)

X = fft(signal);

x = 0:fs/N:fs/2;