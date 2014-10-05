function [FeatureA, FeatureB] = getNormalizedFeature5() 

FeatureA = zeros(10, 100, 10);
for i = 1:10
    input = strcat('HW5/A-', num2str(i-1), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages5(input);
    FeatureA(i, :, :) = F;
end

sum = 0;
for i = 1:10
    for j = 1:100
        for k = 1:10
            sum = sum + FeatureA(i, j, k)^2;
        end
    end
end
rms = sqrt(sum/(10*100*10));

FeatureA = FeatureA / rms;

FeatureB = zeros(10, 100, 10);
for i = 1:10
    input = strcat('HW5/B-', num2str(i-1), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages5(input);
    FeatureB(i, :, :) = F;
end

sum = 0;
for i = 1:10
    for j = 1:100
        for k = 1:10
            sum = sum + FeatureB(i, j, k)^2;
        end
    end
end
rms = sqrt(sum/(10*100*10));

FeatureB = FeatureB / rms;
end