syms x;

f = @(x) exp(x) - log(x) - 20;

ezplot(f, [2, 5])
grid on;
hold on;

yline(0, '--r');
xlabel('x');
ylabel('y');

x0 = 3;
res = fsolve(f, x0)