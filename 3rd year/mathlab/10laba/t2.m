clc; clear;
x = [0.231 0.564 0.896 1.229 1.561 1.894 2.227 2.559 2.892];
y = [-2.748 -2.932 -3.070 -3.391 -3.648 -3.737 -3.911 -4.249 -4.506];
p1 = polyfit(x, y, 1)
p3 = polyfit(x, y, 3)
p5 = polyfit(x, y, 5)
[p6, S6] = polyfit(x, y, 6)
[p7, S7] = polyfit(x, y, 7)
[p8, S8] = polyfit(x, y, 8)
xx = linspace(x(1), x(end), 100);
yy1 = polyval(p1, xx);
yy3 = polyval(p3, xx);
yy5 = polyval(p5, xx);
yy6 = polyval(p6, xx);
yy7 = polyval(p7, xx);
yy8 = polyval(p8, xx);
figure;
plot(x, y, 'o', xx, yy1, xx, yy3, xx, yy5)
legend('DATA', '{\itp}^{(1)}({\itx})', '{\itp}^{(3)}({\itx})','{\itp}^{(5)}({\itx})')
grid on;
figure;
plot(x, y, 'o', xx, yy6, xx, yy7, xx, yy8)
legend('DATA', '{\itp}^{(6)}({\itx})', '{\itp}^{(7)}({\itx})','{\itp}^{(8)}({\itx})')
grid on;