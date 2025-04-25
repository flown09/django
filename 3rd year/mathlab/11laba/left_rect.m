function I = left_rect(f, a, b, N)
h = (b - a) / N;
x = a : h : b - h;
I = h * sum(f(x));
end