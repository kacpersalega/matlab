x = rand(1,50) * 20 - 10; % makes random vector [-10;10]

u = x(x < 0); % logic mask (assigns to vector u only negative numbers from vector x
format short
indeksy = find((x > 0) & (x < 5));
x(1,1:2)

counter = 0;
while (1)
    x = rand();
    if (x > 0.98)
        disp("ZNALEZIONE")
        fprintf("Counter: %d \n", counter)
        break 
    else
       counter = counter + 1;
    end
end