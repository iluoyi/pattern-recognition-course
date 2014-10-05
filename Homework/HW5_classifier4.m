function [confusion4] = HW5_classifier4(FeatureA, FeatureB)

% to train pi
pi(1:10, 1:256) = 0; %10 classes * 256 features
for i = 1:10 % class
    for j = 1:100 % image
        for k = 1:256 % feature
            pi(i, k) = pi(i, k) +  FeatureA(i, j, k);
        end
    end
    for k = 1:256 % feature
         pi(i, k) = pi(i, k) / 100;
         if (pi(i, k) == 0)
            pi(i, k) = 1 / (3 * 100);
         elseif (pi(i, k) == 1)
            pi(i, k) = 1- 1 / (3 * 100);
         end
    end
end

% to test
confusion4(1:10, 1:10) = 0;
for real = 1:10 % for each class
    for j = 1:100 % to classify each image
        classCount(1:10) = 0;
        for p = 1:9
            for q = p+1:10 % for each pair of classes
                g = 0;
                for i = 1:256
                    g = g + (FeatureB(real, j, i) * log(pi(p, i)/pi(q, i)) + (1 - FeatureB(real, j, i)) * log ((1 - pi(p, i))/(1 - pi(q, i))));
                end
                if (g > 0) 
                    classCount(p) = classCount(p) + 1;
                else
                    classCount(q) = classCount(q) + 1;
                end
            end
        end
        classified = real;
        maxCount = 0;
        for i = 1:10
            if (classCount(i) > maxCount) 
                maxCount = classCount(i);
                classified = i;
            end
        end
        confusion4(real, classified) = confusion4(real, classified) + 1;
    end
end


end