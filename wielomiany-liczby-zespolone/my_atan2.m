function phase = my_atan2(b, a)
% my own implementation of atan2

if (a > 0)
    phase = atan(b / a);

elseif (a < 0) && (b >= 0)
    phase = atan(b / a) + pi;

elseif (a < 0) && (b < 0)
    phase = atan(b / a) - pi;

elseif (a == 0) && (b > 0)
    phase = pi / 2; 
    
elseif (a == 0) && (b < 0)
    phase = -pi / 2;
else
    phase = 0;
end