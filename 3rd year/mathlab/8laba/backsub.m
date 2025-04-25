function x = backsub(U, y)
    N = length(y);
    x = zeros(N, 1);
    for i = N:-1:1
        x(i) = (y(i) - U(i, i + 1:end) * x(i + 1:end)) / U(i, i);
    end
end
