x = [0.1 0.3 0.45 0.5 0.79 1.1 1.89 2.4 2.45];
y = [-3 -1 0.9 2.4 2.5 1.9 0.1 -1.3 -2.6];
p1 = polyfit(x, y, 1)
p3 = polyfit(x, y, 3)
p5 = polyfit(x, y, 5)
xx = linspace(x(1), x(end), 100);
yy1 = polyval(p1, xx);
yy3 = polyval(p3, xx);
yy5 = polyval(p5, xx);
%plot(x, y, 'o', xx, yy1, xx, yy3, xx, yy5)
%legend('DATA', '{\itp}^{(1)}({\itx})', '{\itp}^{(3)}({\itx})','{\itp}^{(5)}({\itx})')
%grid on;
%[p3, S3] = polyfit(x, y, 3)
%[p8, S8] = polyfit(x, y, 8)
%[p7, S7] = polyfit(x, y, 7)
%yy7 = polyval(p7, xx);
%yy8 = polyval(p8, xx);
%plot(x, y, 'o', xx, yy7, xx, yy8)
%legend('DATA', '{\itp}^{(7)}({\itx})', '{\itp}^{(8)}({\itx})')
[p9, S9] = polyfit(x, y , 9)
yy9 = polyval(p9, xx);
plot(x, y, 'o', xx, yy8, xx, yy9)
legend('DATA', '{\itp}^{(8)}({\itx})', '{\itp}^{(9)}({\itx})')
grid on;
