x = [0.1 2.2 3.1 4.9 6.5];
y = [0.8 0.9 0.1 -0.7 -0.9];
xx = linspace(x(1), x(end), 100);
yy = newton(x, y, xx);
plot(x,y,'o',xx,yy)