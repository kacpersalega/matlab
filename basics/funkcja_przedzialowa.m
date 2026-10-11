function output = funkcja_przedzialowa(x)

if (x < 0 || x > 5)
    output = 0;
elseif (x >= 0 && x <= pi)
    output = sin(x);
else 
    output = x^2;
end