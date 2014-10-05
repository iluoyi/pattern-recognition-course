function [confusion1] = HW6_classifier1(FeatureA, FeatureB)

confusion1(1:10, 1:10) = 0;
I = eye(10);
for real = 1:10 % for each class
    for i = 1:100 % to classify each image
        for k = 1:10 % feature
            crt(k) = FeatureB(real, i, k);
        end
        dist = 0;
        min = 32767;
        classified = real;
        for c = 1:10
            for j = 1:100
                for k = 1:10 % feature
                    target(k) = FeatureA(c, j, k);
                end
                dist = HW6_Minkowski(crt, target, 10, 2);
                if (dist <= min) 
                    min = dist;
                    classified = c;
                end
            end
        end       
        confusion1(real, classified) = confusion1(real, classified) + 1;
    end
end

end