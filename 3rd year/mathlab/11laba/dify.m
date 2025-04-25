clc; clear;
syms x;
f = @(x) x.*sin(3*x);
disp(diff(f, x, 2))