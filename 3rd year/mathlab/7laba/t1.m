syms x y;
f1 = cos(x) + y - 1.5;
f2 = 2*x - sin(y - 0.5) - 1;
ezplot(f1, [-5,5]), hold
ezplot(f2, [-5,5]), grid

X0 = [0.5, 0.6];
F = @(X) [cos(X(1)) + X(2) - 1.5;
             2*X(1) - sin(X(2) - 0.5) - 1];
X = fsolve(F, X0);
fprintf('Решение системы:\n x = %.6f\n y = %.6f\n', X(1), X(2));
val_f1 = subs(f1, [x, y], [X(1), X(2)]);
val_f2 = subs(f2, [x, y], [X(1), X(2)]);
fprintf('Проверка подстановкой в уравнения:\n f1 = %.6f\n f2 = %.6f\n', double(val_f1), double(val_f2));