function I = trapezoidal(f, a, b, N)
h = (b - a) / N;
x = a : h : b;
I = h * (sum(f(x)) - 0.5 * (f(a) + f(b)));
end