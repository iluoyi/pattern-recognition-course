function [ma] = getMA(p, q, I, w, h)

ma = 0;

for x = 1:w
    for y = 1:h
       ma = ma + x^p * y^q * I(x, y);
    end
end

end