dx = 0.01;
x = -2:dx:2;
f = @(x) x.^2-3;
y = f(x);
df1 = (y(2:end) - y(1:end-1)) / dx;
df2 = 