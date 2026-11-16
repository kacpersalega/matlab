R1 = 1e3;     
U1 = 0:0.01:5;

Is = 1e-12;   
Ut = 26e-3;  

ID = zeros(1, length(U1)); 

tol = 1e-8; 

for k = 1:length(U1)
    a = 0; 
    b = U1(k) / R1; 

    if b == 0
        b = 1e-6; 
    end

    while ((b - a) / 2) > tol
        c = (a + b) / 2; 

        fa = a - Is * (exp((U1(k) - a * R1) / Ut) - 1);
        fc = c - Is * (exp((U1(k) - c * R1) / Ut) - 1);

        if fc == 0
            break; % idealne miejsce zerowe
        end

        if fa * fc < 0 
            b = c;
        else           
            a = c;
        end
    end

    Ix = (a + b) / 2;
    ID(k) = Ix;
end

figure;
plot(U1, ID * 1000, 'b-', 'LineWidth', 2);
xlabel('U_1 [V]');
ylabel('I_D [mA]');
title('Prąd w układzie rezystor - dioda');
grid on;