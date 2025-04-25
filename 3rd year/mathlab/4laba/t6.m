f = @(x) x^3 - x - 1;
[r, I] = dihotomiya(f, 5, 6, 0.0001);
f_root = f(r);
