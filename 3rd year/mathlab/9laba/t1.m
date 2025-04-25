A = [-401.52 200.16; 1200.96 -601.68];
b = [200; -600];
x = A\b;
b1 = [199; -601];
x1 = A\b1;
x_Avg = (x+x1)/2
fault = norm(x-x_Avg)/norm(x)
mark_fault = cond(A,1) * (norm(b-b1)/norm(b))