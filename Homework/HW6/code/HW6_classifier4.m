function [confusion4] = HW6_classifier4(FeatureA, FeatureB)

confusion4(1:10, 1:10) = 0;
I = eye(10);
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
                dist = HW6_Minkowski(crt, target, 256, 2);
                if (dist <= min) 
                    min = dist;
                    classified = c;
                end
            end
        end       
        confusion4(real, classified) = confusion4(real, classified) + 1;
    end
end

end