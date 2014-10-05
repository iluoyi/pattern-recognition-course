function [confusion3] = HW5_classifier3(FeatureA, FeatureB)

% to train the mu
u(1:10, 1:256) = 0; %10 classes * 256 features
for i = 1:10 % class
    for j = 1:100 % image
        for k = 1:256 % feature
            u(i, k) = u(i, k) +  FeatureA(i, j, k);
        end
    end
    for k = 1:256 % feature
        u(i, k) = u(i, k) / 100;
    end
end

% to test
confusion3(1:10, 1:10) = 0;
I = eye(256);
for real = 1:10 % for each class
    for j = 1:100 % to classify each image
        min = 32767;
        classified = real;
        for c = 1:10
            dist = 0;
            for k = 1:256 % feature
                dist = dist + (FeatureB(real, j, k) - u(c, k))^2;
            end
            if (dist < min) 
                min = dist;
                classified = c;
            end
        end
        confusion3(real, classified) = confusion3(real, classified) + 1;
    end
end

end