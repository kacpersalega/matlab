% Comparison between my own implementation of atan2 and built it functions

format long

% wektory testowe
re = [1 1 0 -1 -2 -1 0 1 0]; % Realis 
im = [0 1 2 1 0 -1 -3 -sqrt(3) 0]; % imaginalis

N = length(re);
max_err = 0;

for n = 1:N
    a = re(n);
    b = im(n);

    my_value = my_atan2(b,a);
    built = atan2(b,a);

    diff = abs(my_value - built);
    max_err = max(max_err, diff);
    
    disp(max_err)

end
