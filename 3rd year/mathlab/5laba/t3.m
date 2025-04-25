syms x
f = x * (exp(x) - x - 1);
df = diff(f, x);
result = subs(df, x, 4);
disp(double(result))