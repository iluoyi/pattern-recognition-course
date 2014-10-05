function [L, h, w, F] = readLetterImagesPixel5(filename)

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
F(1:size, 1:256) = 0;
for i = 1:size
    count = 0;
    for x = 1:imgSize % w
        for y = 1:imgSize % h
            count = count + 1;
            F(i, count) = L(i, y, x);
        end
    end
end

end
