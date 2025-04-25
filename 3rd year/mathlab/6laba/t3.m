ezplot('2*x^2+3*(y-1)^2-7',[-2,3]), hold
ezplot('(x+2)^2-3*(y)^2-6',[-2,3]), grid
x = fsolve (@fsolvedemo, [1.5 1.5])