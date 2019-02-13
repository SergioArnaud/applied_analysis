
function [y] = griewank(xx)

d = length(xx);
sum_ = 0;
prod_ = 1;

for ii = 1:d
    xi = xx(ii);
    sum_ = sum_ + xi^2/4000;
    prod_ = prod_ * cos(xi/sqrt(ii));
end

y = sum_ - prod_ + 1;

end