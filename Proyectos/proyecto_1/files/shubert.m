
function [ans] = shubert(X)
    if (length(size(X)) > 2)
        x = X(:,:,1);
        y = X(:,:,2);
    else
        x = X(1);
        y = X(2);
    end

    n = length(x);
    sum1 = zeros(1,n);
    sum2 = zeros(1,n);
    
    for i = 1:5
        sum1 = sum1 + i .* cos((i+1).*x+i);
        sum2 = sum2 + i .* cos((i+1).*y+i);
    end

    ans = sum1 .* sum2;
end