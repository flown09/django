% Увеличение числа узлов интерполяции
x_more = linspace(pi/8, pi/2, 10); % 10 узлов
y_more = cot(x_more);
% Генерация точек для интерполяции
xx = linspace(pi/8, pi/2, 100);
% Интерполяция методом Лагранжа
yy_lagrange_more = lagrange(x_more, y_more, xx);
% Интерполяция методом Ньютона
yy_newton_more = newton(x_more, y_more, xx);
% Построение графиков
figure;
plot(xx, yy_lagrange_more, 'b', 'LineWidth', 1.5);
hold on;
plot(xx, yy_newton_more, 'r--', 'LineWidth', 1.5);
plot(x_more, y_more, 'ko', 'MarkerSize', 8, 'LineWidth', 2);
xlabel('x');
ylabel('y');
legend('Лагранж', 'Ньютон', 'Узлы интерполяции');
title('Интерполяция с увеличенным числом узлов (10 узлов)');
grid on;