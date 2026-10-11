% simple file to create some random plots

t = tiledlayout(2,2);
title(t,"Trigonometric Functions")
x = linspace(0, 2*pi);

nexttile
plot(x,sin(x))
title("Sine")

nexttile
plot(x,cos(x))
title("Cosine")

nexttile([1 2])
plot(x, tan(x))
title("Tangent")