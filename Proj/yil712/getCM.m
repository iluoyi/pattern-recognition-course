function [cm] = getCM5(p, q, max, may, I, w, h)

cm = 0;

for x = 1:w
    for y = 1:h
       cm = cm + (x - max)^p * (y - may)^q * I(x, y);
    end
end

end