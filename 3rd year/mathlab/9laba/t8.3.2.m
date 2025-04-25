x_more = linspace(pi/8, pi/2, 10);
y_more = cot(x_more);

% Точное значение функции в X*
y_exact = cot(pi/3);
% Интерполированные значения
yy_lagrange_more_star = lagrange(x_more, y_more, pi/3 + 0.01);
yy_newton_more_star = newton(x_more, y_more, pi/3 + 0.01);
% Погрешность
error_lagrange_more = abs(yy_lagrange_more_star - cot(pi/3 + 0.01));
error_newton_more = abs(yy_newton_more_star - cot(pi/3 + 0.01));
% Вывод погрешностей
fprintf('Погрешность для 10 узлов: Лагранж = %.10f, Ньютон = %.10f\n', error_lagrange_more, error_newton_more);
