function [confusion1] = Proj_classifier1(FeatureA, FeatureB)

% to train the mu
u(1:10, 1:20) = 0; %10 classes * 20 features
for i = 1:10 % class
    for j = 1:100 % image
        for k = 1:20 % feature
            u(i, k) = u(i, k) +  FeatureA(i, j, k);
        end
    end
    for k = 1:20 % feature
        u(i, k) = u(i, k) / 100;
    end
end

% to test
confusion1(1:10, 1:10) = 0;
I = eye(20);
for real = 1:10 % for each class
    for j = 1:100 % to classify each image
        min = 32767;
        classified = real;
        for c = 1:10
            dist = 0;
            x(1:20) = 0;
            mu(1:20) = 0;
            for k = 1:20 % feature
                x(k) = FeatureB(real, j, k);
                mu(k) = u(c, k);
            end
            dist = (x - mu)*(I^-1)*(x - mu)';
            if (dist < min) 
                min = dist;
                classified = c;
            end
        end
        confusion1(real, classified) = confusion1(real, classified) + 1;
    end
end

end