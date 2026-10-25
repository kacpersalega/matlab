function b = moja_calka(a, C)
% calka nieoznaczona z wielomianu
% b zwraca wektor wspolczynnikow przy wielomianie calki

if nargin == 1
    C = 0;
end

a = a(:).'
n = length(a) - 1;
b = [1./((n + 1):-1:1).* a , C]

 