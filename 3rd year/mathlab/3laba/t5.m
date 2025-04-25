x = -3:0.01:3;
f =0.5*x+0.1*sin(25*x);
plot(x, f)
hold on
g = abs(x);
plot(x, g)
grid on
