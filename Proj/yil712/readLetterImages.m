function [L, h, w, max, may, F] = readLetterImages(filename)

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
F(1:size, 1:20) = 0;
for i = 1:size
    I(imgSize, imgSize) = 0;
    for x = 1:imgSize % w
        for y = 1:imgSize % h
            I(x, y) = L(i, y, x);
        end
    end
    max(i) = getMA(1, 0, I, imgSize, imgSize) / getMA(0, 0, I, imgSize, imgSize);
    may(i) = getMA(0, 1, I, imgSize, imgSize) / getMA(0, 0, I, imgSize, imgSize);
    F(i, 1) = getCM(2, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 2) = getCM(1, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 3) = getCM(3, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 4) = getCM(2, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 5) = getCM(1, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 6) = getCM(4, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 7) = getCM(3, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 8) = getCM(2, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 9) = getCM(1, 4, max(i), may(i), I, imgSize, imgSize);
    F(i, 10) = getCM(5, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 11) = getCM(4, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 12) = getCM(3, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 13) = getCM(2, 4, max(i), may(i), I, imgSize, imgSize);
    F(i, 14) = getCM(1, 5, max(i), may(i), I, imgSize, imgSize);
    F(i, 15) = getCM(6, 1, max(i), may(i), I, imgSize, imgSize);
    F(i, 16) = getCM(5, 2, max(i), may(i), I, imgSize, imgSize);
    F(i, 17) = getCM(4, 3, max(i), may(i), I, imgSize, imgSize);
    F(i, 18) = getCM(3, 4, max(i), may(i), I, imgSize, imgSize);
    F(i, 19) = getCM(2, 5, max(i), may(i), I, imgSize, imgSize);
    F(i, 20) = getCM(1, 6, max(i), may(i), I, imgSize, imgSize);
end

end
