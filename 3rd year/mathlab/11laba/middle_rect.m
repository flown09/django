function I = middle_rect(f, a, b, N)
h = (b - a) / N;
x = a + h/2 : h : b - h/2;
I = h * sum(f(x));
end