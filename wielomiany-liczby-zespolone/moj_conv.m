function c = moj_conv(a, b)
    n = length(a);
    m = length(b);
    nc = n + m - 1;
  
    c = zeros(1, nc);

    for k = 1:n
        for l = 1:m
            c(k + l - 1) = c(k + l - 1) + a(k) * b(l);
        end
    end
end