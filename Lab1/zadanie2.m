function A = zadanie2(M, N)
A = zeros(M, N);
K = min(M, N);

for i = 1:M
    for j = 1:N
        % czy pkt lezy w kwadracie KxK
        if i <= K && j <= K
            % jedna albo druga przekatna
            if (i == j) || (i + j == K + 1)
                A(i, j) = 2; % zapelniamy 2
            end
        end
    end
end
end