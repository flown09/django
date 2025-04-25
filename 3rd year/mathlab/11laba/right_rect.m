function I = right_rect(f, a, b, N)
h = (b - a) / N;
x = a + h : h : b;
I = h * sum(f(x));
end