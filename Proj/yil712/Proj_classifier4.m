function [confusion4] = Proj_classifier4(FeatureA, FeatureB)

confusion4(1:10, 1:10) = 0;

for real = 1:10 % for each class
    for i = 1:100 % to classify each image
        classCount(1:10) = 0;
        
        for k = 1:20 % feature
            crt(k) = FeatureB(real, i, k);
        end
        dist = 0;
        min1 = 32767;
        min2 = 32767;
        min3 = 32767;
        min4 = 32767;
        min5 = 32767;
        c1 = real;
        c2 = real;
        c3 = real;
        c4 = real;
        c5 = real;
        for c = 1:10
            for j = 1:100
                for k = 1:20 % feature
                    target(k) = FeatureA(c, j, k);
                end
                classified = c;
                dist = getMinkowski(crt, target, 20, 2);
                if (dist < min1) 
                    temp = min1;
                    min1 = dist;
                    dist = temp; % swap and pass on
                    tempc = c1;
                    c1 = classified;
                    classified = tempc; % swap and pass on
                end
                if (dist < min2) 
                    temp = min2;
                    min2 = dist;
                    dist = temp;
                    tempc = c2;
                    c2 = classified;
                    classified = tempc;
                end
                if (dist < min3)
                    temp = min3;
                    min3 = dist;
                    dist = temp;
                    tempc = c3;
                    c3 = classified;
                    classified = tempc;
                end
                if (dist < min4)
                    temp = min4;
                    min4 = dist;
                    dist = temp;
                    tempc = c4;
                    c4 = classified;
                    classified = tempc;
                end
                if (dist < min5)
                    temp = min5;
                    min5 = dist;
                    dist = temp;
                    tempc = c5;
                    c5 = classified;
                    classified = tempc;
                end
            end
        end
        classCount(c1) = classCount(c1) + 1;
        classCount(c2) = classCount(c2) + 1;
        classCount(c3) = classCount(c3) + 1;
        classCount(c4) = classCount(c4) + 1;
        classCount(c5) = classCount(c5) + 1;
        
        classified = real;
        maxCount = 0;
        for d = 1:10
            if (classCount(d) > maxCount) 
                maxCount = classCount(d);
                classified = d;
            end
        end
        
        confusion4(real, classified) = confusion4(real, classified) + 1;
    end
end

end