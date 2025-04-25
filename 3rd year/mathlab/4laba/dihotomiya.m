function[root, Iterations] = dihotomiya(f,a,b,eps)
% Вход
% - f - функция
% - [а, b] - отрезок, внутри которого находится искомый корень
% - eps - задаваемая точность
% Выход
% - root - полученное приближенное решение
% - Iterations - число выполненных итераций
% Пример использования
% [r,I]=dihotomiya(@sin,3,4,0.001)
% [r,I]=dihotomiya(@f,a,b,0.0001), если f - функция из файла
%f.m
% [r,I]=dihotomiya(f,5,6,0.001), если f - анонимная функция,
% например, f=@(x) cos(2*x)+x-5;
if a>=b
 'a<b is not true. Stop!'
 return
end

if f(a)*f(b)>0
 'f(a) and f(b) are of the same sign. Stop!'
 return
end
k=0; % счетчик числа итераций
while (b-a > 2*eps)
 c=(a+b)/2;
 if f(c)==0
 break
 else
 if f(b)*f(c)<0
 a=c;
 else
 b=c;
 end
 end
 k=k+1;
end
root=(a+b)/2;
Iterations=k;