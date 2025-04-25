function [x, flag] = gauss(A,b)
[N,N] = size(A);
x = zeros(N,1);
C = zeros(1,N+1);
B = [A b];
flag = 1;
epsilon = 1e-15;
for s=1:N
    [Y, j] = max(abs (B(s:N, s)));
    C = B(s,:);
    B(s,:) = B(j+s-1,:);
    if abs(B(s,s)) <=epsilon
        disp('Матрица A вырождена');
        flag = 0;
        break
    end
    B(s,s:N+1) = B(s,s:N+1)/B(s,s);
    for k = s+1:N
        m = B(k,s) / B(s,s);
        B(k,s:N+1) = B(k, s:N+1) - m*B(s,s:N+1);
    end
end
if flag
    x=backsub(B(1:N,1:N),B(1:N,N+1));
end