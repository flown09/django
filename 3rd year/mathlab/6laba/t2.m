syms x y
dfx = diff(tan((x*y)+0.2)-x^2, x);
pretty(dfx)
dfy = diff(tan((x*y)+0.2)-x^2, y);
pretty(dfy)