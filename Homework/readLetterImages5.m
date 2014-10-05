function [L, h, w, max, may, F] = readLetterImages5(filename)

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
fclose(fid1);

imgSize = 16;
F(1:size, 1:10) = 0;
for i = 1:size
    I(imgSize, imgSize) = 0;
    for x = 1:imgSize % w
        for y = 1:imgSize % h
            I(x, y) = L(i, y, x);
        end
    end
    max(i) = getMA5(1, 0, I, imgSize, imgSize) / getMA5(0, 0, I, imgSize, imgSize);
    may(i) = getMA5(0, 1, I, imgSize, imgSize) / getMA5(0, 0, I, imgSize, imgSize);
    F(i, 1) = getCM5(1, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 2) = getCM5(2, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 3) = getCM5(1, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 4) = getCM5(3, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 5) = getCM5(2, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 6) = getCM5(1, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 7) = getCM5(4, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 8) = getCM5(3, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 9) = getCM5(2, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 10) = getCM5(1, 4, max(i), may(i), I, imgSize, imgSize);
end

end
