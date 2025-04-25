clc; clear;
syms x y;
f1 = cos(x) + y - 1.5;
f2 = 2*x - sin(y - 0.5) - 1;

dfx1 = diff(f1, x)
dfy1 = diff(f1, y)
dfx2 = diff(f2, x)
dfy2 = diff(f2, y)