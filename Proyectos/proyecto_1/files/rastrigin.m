function [fx] = rastrigin(X)

if (length(size(X)) > 2)
    x = X(:,:,1);
    y = X(:,:,2);
else
    x = X(1);
    y = X(2);
end

s = (x.^2 - 10.*cos(2.*pi.*x));
s = s + (y.^2 - 10.*cos(2.*pi.*y));

fx = 10*2 + s;

end