
x = randi([11, 7927], 1, 1);
disp(x);

suma = 0;
temp = x;

while temp > 0
    cyfra = rem(temp, 10); 
    suma = suma + cyfra; 
    temp = fix(temp / 10); 
end

disp("Suma cyfr:")
disp(suma)