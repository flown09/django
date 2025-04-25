clc; clear;
f = @(x) x.*sin(3*x);
df = @(x) sin(3*x) + 3*x.*cos(3*x);
df2 = @(x) 6*cos(3*x) - 9*x.*sin(3*x);
% Параметры сетки
h = 0.2; % Шаг сетки
x = 0:h:1.5; % Диапазон значений x
n = length(x); % Количество точек
% Аналитические производные
dy_exact = df(x);
d2y_exact = df2(x);
% --- Численные методы первой производной ---
% Правая разностная схема
dy_right = zeros(1, n);
for i = 1:(n-1)
 dy_right(i) = (f(x(i+1)) - f(x(i))) / h;
end
% Левая разностная схема
dy_left = zeros(1, n);
for i = 2:n
 dy_left(i) = (f(x(i)) - f(x(i-1))) / h;
end
% Центральная разностная схема
dy_central = zeros(1, n);
for i = 2:(n-1)
 dy_central(i) = (f(x(i+1)) - f(x(i-1))) / (2*h);
end
% Метод 4-го порядка
dy_fourth = zeros(1, n);
for i = 3:(n-1)
dy_fourth(i) = (-f(x(i+1)) + 27*f(x(i)) - 27*f(x(i-1)) + f(x(i-2))) / (24*h);
end
% --- Численные методы второй производной ---
% Центральная разностная схема для второй производной
d2y_central = zeros(1, n);
for i = 2:(n-1)
 d2y_central(i) = (f(x(i+1)) - 2*f(x(i)) + f(x(i-1))) / h^2;
end
% Метод 4-го порядка для второй производной
d2y_fourth = zeros(1, n);
for i = 3:(n-2)
d2y_fourth(i) = (-f(x(i+2)) + 16*f(x(i+1)) - 30*f(x(i)) + 16*f(x(i-1)) - f(x(i-2))) / (12*h^2);
end
% --- Построение графиков ---
figure;
plot(x, dy_exact, '-k', 'LineWidth', 2); hold on;
plot(x(1:end-1), dy_right(1:end-1), '--r', 'LineWidth', 1.5);
plot(x(2:end), dy_left(2:end), '--g', 'LineWidth', 1.5);
plot(x(2:end-1), dy_central(2:end-1), '--b', 'LineWidth', 1.5);
plot(x(3:end-1), dy_fourth(3:end-1), '--m', 'LineWidth', 1.5);
legend('Аналитическая', 'Правая', 'Левая', 'Центральная', '4-й порядок');
title('Первая производная');
grid on;
figure;
plot(x, d2y_exact, '-k', 'LineWidth', 2); hold on;
plot(x(2:end-1), d2y_central(2:end-1), '--b', 'LineWidth', 1.5);
plot(x(3:end-2), d2y_fourth(3:end-2), '--m', 'LineWidth', 1.5);
legend('Аналитическая', 'Центральная', '4-й порядок');
title('Вторая производная');
grid on;