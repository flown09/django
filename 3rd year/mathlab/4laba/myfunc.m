function result = myfunc(x)
    if abs(x) < 1
        warning ('Результат комплексный')
    end
    result = sqrt(x^2 - 1);
end
