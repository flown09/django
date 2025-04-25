A = [24 2 4 -9;
    -6 -27 -8 -6;
    -4 8 19 6;
    4 5 -3 -13];
f = [-9; -76; -79; -70];
x = A\f
r = rank(A);
d = det(A);
e = eig(A);
inv_A = inv(A);
pinv_A = pinv(A);

fprintf('Ранг матрицы: %d\n', r);
fprintf('Определитель: %.6f\n', d);
disp('Собственные значения:');
disp(e);
disp('Обратная матрица:');
disp(inv_A);
disp('Псевдообратная матрица:');
disp(pinv_A);