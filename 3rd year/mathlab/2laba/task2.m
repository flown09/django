% 1. Арифметические операции
% Сумма и разность двух чисел без присвоения значений
sum_result = 7 + 3
sub_result = 7 - 3

% Произведение и частное двух чисел с присвоением значений
A = 5;
B = 2;
mul_result = A * B
div_result = A / B

% Проверка 1/0 и 0/0
inf_result = 1 / 0
nan_result = 0 / 0

% 2. Список элементарных функций
help elfun

% 3. Вычисление функции из задания
x_val = 2.5;
b_val = 0.04;
k_val = 3;
n_val = 5;
y_result = (1/9) - (10^(-4) * exp(k_val * x_val)) + cos(sqrt(x_val^2 + b_val)) + sqrt(x_val^2 + b_val) / (0.4 * x_val) + (sin(3) / ((x_val^2 + b_val) * n_val))

% 4. Создание вектора и вычисление значений функции для нескольких значений x
x = linspace(1, 5, 5);
y_values = (1/9) - (10^(-4) * exp(k_val * x)) + cos(sqrt(x.^2 + b_val)) + sqrt(x.^2 + b_val) ./ (0.4*x) + (sin(3) ./ ((x.^2 + b_val) * n_val))

% 5. Просмотр списка переменных
who

% 6. Сохранение результатов
save results.mat

% 7. Очистка рабочей области
disp('Очистка рабочей области')
clear

% 8. Загрузка сохраненных переменных
load results.mat

% 9. Очистка командного окна
%clc

% 10. Ввод с клавиатуры
v = input('Введите вектор-строку размерности 2: ');
w = input('Введите вектор-столбец размерности 2: ');
m = input('Введите матрицу 2x2: ');

% 11. Создание матриц
zero_matrix = zeros(2,2)
one_matrix = ones(2,2)
mr = rand(2,2)
me = eye(2)

% 12. Вычисления с матрицами
M = v * w + m + mr * me

% Анализ матрицы M
rows = size(M, 1)
cols = size(M, 2)
max_elem = max(M(:))
min_elem = min(M(:))
sum_elems = sum(M(:))
prod_elems = prod(M(:))
