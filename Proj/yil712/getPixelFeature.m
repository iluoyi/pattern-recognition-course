function [FeaturePA, FeaturePB, FeaturePC, FeaturePD] = getPixelFeature() 

FeaturePA = zeros(10, 100, 256);
for i = 1:10
    input = strcat('data/A-', num2str(i), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel(input);
    FeaturePA(i, :, :) = F;
end

FeaturePB = zeros(10, 100, 256);
for i = 1:10
    input = strcat('data/B-', num2str(i), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel(input);
    FeaturePB(i, :, :) = F;
end

FeaturePC = zeros(10, 100, 256);
for i = 1:10
    input = strcat('data/C-', num2str(i), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel(input);
    FeaturePC(i, :, :) = F;
end

FeaturePD = zeros(10, 100, 256);
for i = 1:10
    input = strcat('data/D-', num2str(i), '-pre.txt');
    [L, h, w, F] = readLetterImagesPixel(input);
    FeaturePD(i, :, :) = F;
end

end