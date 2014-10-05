function [L, h, w, F] = readLetterImages(filename)

fid1 = fopen(filename);

size = 100;
numOfL = 1;
L(1:size,:,:) = 0; % all letter images
while ~feof(fid1)
    line = fgetl(fid1);
    if (line(1) == 'C')
        para = regexp(line,'\s','split');
        height = para{2};
        weight = para{3};
        h(numOfL) = str2num(height(2:end)); % to get the height of the matrix
        w(numOfL) = str2num(weight(2:end)); % to get the weight of the matrix
    end
    
    for i = 1:h(numOfL)
        line = fgetl(fid1);
        for j = 1:w(numOfL)
            if (line(j) == '.')
                L(numOfL, i, j) = 0;
            else
                L(numOfL, i, j) = 1;
            end
        end
    end
    
    numOfL = numOfL + 1;
end

F(1:size, 1:3) = 0;
for n = 1:size
    mid = h(n) / 2;
    for i = 1:h(n)
        for j = 1:w(n)
            if (L(n, i, j) == 0)
                F(n, 1) = F(n, 1) + 1; % white area
            else
                F(n, 2) = F(n, 2) + 1; % black area
            end
            if ((i >= mid - 1) && (i <= mid + 1) && (L(n, i, j) == 1))
                F(n, 3) = F(n, 3) + 1; % black pixels in the middle area
            end
        end
    end
end

end
