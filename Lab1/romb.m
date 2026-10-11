function romb(N,M)
% this function draws romb N and M must be odd

A = zeros(N, M);

% smaller dimension 
S = min(N, M);

% calculating center
c = (S + 1) / 2;
R = c - 1;

for i = 1:N % per rows
    for j = 1:M % per cols
        if abs(i - c) + abs(j - c) == R
            A(i, j) = 4;
        end
    end
end

disp(A)