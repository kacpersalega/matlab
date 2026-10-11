% zadanie 1 dla gemini

clc
clear

% zadanie 1.1
v = -2:0.5:3;
I = eye(3); % this creates 3x3 eye matrix
J = ones(3,2);
R = rand(3,1);
M = [I, J, R] % combine into one matrix (must have same rows)
temp = zeros(1,6);
M = [M; temp]

% zadanie 1.2
B = M(2:3, 1:2:end) % 2 and 3 rows and nieparzyste cols
M(3:4, 2:3) = rand(2,2) * 10

M = M(:); % turn into one col vec

wyznacznik = det(I)
rzad = rank(I)

format short 
pi 
format long
pi
format short