function I = simpson(f, a, b, N)
h = (b - a) / N;
x = a : h : b;
I = h/3 * (f(a) + f(b) + 4 * sum(f(x(2:2:end-1))) + 2 * sum(f(x(3:2:end-2))));
end