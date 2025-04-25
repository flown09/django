x_a = [pi/8, 2*pi/8, 3*pi/8, 4*pi/8];
y_a = cot(x_a);
x_b = [pi/8, 5*pi/16, 3*pi/8, pi/2];
y_b = cot(x_b);

y_exact = cot(pi/3);
yy_lagrange_a_star = lagrange(x_a, y_a, pi/3);
yy_newton_a_star = newton(x_a, y_a, pi/3);
yy_lagrange_b_star = lagrange(x_b, y_b, pi/3);
yy_newton_b_star = newton(x_b, y_b, pi/3);
error_lagrange_a = abs(yy_lagrange_a_star - y_exact);
error_newton_a = abs(yy_newton_a_star - y_exact);
error_lagrange_b = abs(yy_lagrange_b_star - y_exact);
error_newton_b = abs(yy_newton_b_star - y_exact);
fprintf('Погрешность для узлов a): Лагранж = %f, Ньютон = %f\n', error_lagrange_a, error_newton_a);
fprintf('Погрешность для узлов б): Лагранж = %f, Ньютон = %f\n', error_lagrange_b, error_newton_b);
