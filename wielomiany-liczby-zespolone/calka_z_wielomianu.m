function b = calka_z_wielomianu(a, C)
% analityczna calka z wielomianu

% jesli podany tylko jeden arg to przyjmujemy ze C = 0
if nargin == 1
    C = 0;
end

a = a(:).';
n = length(a) - 1;
b = [ 1./((n + 1):-1:1).*a , C];
