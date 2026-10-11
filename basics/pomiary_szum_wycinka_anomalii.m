% Zadanie A

clc; clear; close all

time = 0:0.02:4*pi;
base_signal = 3 * sin(time);
noise =  -0.5 + (0.5 - (-0.5))*rand(size(time));
noisy_signal = base_signal + noise;

for n = 1:3
    id = randi(size(time))
    noisy_signal(id) = noisy_signal(id) + 10;
end

%filtration
overunder = find(noisy_signal > 3.6 | noisy_signal < -3.6)
noisy_signal(overunder) = 0;

[minimum, minimum_id] = min(noisy_signal);
t_min = time(minimum_id);
[maximum, maximum_id] = max(noisy_signal);
t_max = time(maximum_id);

figure(1);
hold on;
grid on;
plot(time, base_signal, 'g-');
plot(time, noisy_signal, 'b-');
plot(t_max, maximum, 'ro');
plot(t_min, minimum, 'gs');
title("sygnalek");
xlabel("x");
ylabel("y");
legend();