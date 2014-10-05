function [distance] = getMinkowski(a, b, d, k)

distance = 0;

for i = 1:d
    distance = distance + (abs(a(i) - b(i)))^k;
end

distance = distance ^ (1/k);

end