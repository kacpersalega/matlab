A = [1 2; 3 4]
B = [2 0; 1 2]

iloczyn_macierzowy = A * B
iloczyn_elementowy = A .* B

x = 1:5
y = 2.^x

format long
eps % eps to najmniejsza liczba, dla ktorej w arytmetyce zmiennoprzecinkowej z
% zachodzi 1 + eps > 1. Wynosi w przyblizeniu 2.2204 * 10^-16
1 + eps 
1 + eps/2 % daje logiczne 1 bo operacja zachodzi ponizej progu widzialnosci programu (zbyt duza rozdzielczosc dla kompa)

