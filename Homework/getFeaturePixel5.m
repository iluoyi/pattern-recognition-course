function [FeatureA, FeatureB] = getFeaturePixel5() 

FeatureA = zeros(10, 100, 256);
for i = 1:10
    input = strcat('HW5\A-', num2str(i-1), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel5(input);
    FeatureA(i, :, :) = F;
end

FeatureB = zeros(10, 100, 256);
for i = 1:10
    input = strcat('HW5\B-', num2str(i-1), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel5(input);
    FeatureB(i, :, :) = F;
end

end