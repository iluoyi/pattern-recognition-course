function [] = preprocessImg(input, output)

fid1 = fopen(input);

size = 100;
numOfL = 1;
L(1:size,:,:) = 0; % all letter images
while ~feof(fid1)
    line = fgetl(fid1);
    if (line(1) == 'C')
        para = regexp(line,'\s','split');
        height = para{2};
        weight = para{3};
        index = para{4};
        h(numOfL) = str2num(height(2:end)); % to get the height of the matrix
        w(numOfL) = str2num(weight(2:end)); % to get the weight of the matrix
        b(numOfL) = str2num(index(2:end));
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

fid2 = fopen(output, 'W');
dataSize = 16;
for i = 1:size
    fprintf(fid2, 'C h16 w16 b%d\n', b(i));
    up = fix((dataSize - h(i)) / 2);
    down = dataSize - h(i) - up;
    left = fix((dataSize - w(i)) / 2);
    
    for m = 1:up
        for n = 1:dataSize
            fprintf(fid2, '.');
        end
        fprintf(fid2, '\n');
    end
    
    for m = 1:h(i)
        for n = 1:dataSize
            if (n <= left || n > left + w(i))
                fprintf(fid2, '.');
            else
                if (L(i, m, n - left) == 0)
                     fprintf(fid2, '.');
                else
                     fprintf(fid2, 'x');
                end
            end
        end
        fprintf(fid2, '\n');
    end
    
    for m = 1:down
        for n = 1:dataSize
            fprintf(fid2, '.');
        end
        fprintf(fid2, '\n');
    end
end

fclose(fid2);
end
