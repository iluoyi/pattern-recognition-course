function [confusion3] = Proj_classifierP3(FeatureA, FeatureB)

confusion3(1:10, 1:10) = 0;

for real = 1:10 % for each class
    for i = 1:100 % to classify each image
        for k = 1:256 % feature
            crt(k) = FeatureB(real, i, k);
        end
        dist = 0;
        min = 32767;
        classified = real;
        for c = 1:10
            for j = 1:100
                for k = 1:256 % feature
                    target(k) = FeatureA(c, j, k);
                end
                dist = getMinkowski(crt, target, 256, 2);
                if (dist <= min) 
                    min = dist;
                    classified = c;
                end
            end
        end       
        confusion3(real, classified) = confusion3(real, classified) + 1;
    end
end

end