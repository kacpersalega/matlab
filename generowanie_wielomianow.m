clc;
clear;
close all;

N = 5; % stopień wielomianu
K = 10; % Liczba iteracji

for k = 1:K
    miejsca_zerowe = rand(5,1);
    a = poly(miejsca_zerowe); % przekształcanie miejsc zerowych we współczynniki wielomianu
    x = -0.1:0.001:1.1; 
    y = polyval(a,x); % oblicza wartość wielomianu w punkcie X na podstawie współczynników

    figure(1);
    clf;
    plot(x,y)
    grid on;
    hold on;
    plot(miejsca_zerowe, polyval(a,miejsca_zerowe), 'ro');
    pause;

end 
