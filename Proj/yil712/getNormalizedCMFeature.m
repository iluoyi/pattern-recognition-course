function [FeatureA, FeatureB, FeatureC, FeatureD] = getNormalizedCMFeature() 

FeatureA = zeros(10, 100, 20);
for i = 1:10
    input = strcat('data/A-', num2str(i), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages(input);
    FeatureA(i, :, :) = F;
end


for k = 1:20
    sum = 0;
    for i = 1:10
        for j = 1:100
            sum = sum + FeatureA(i, j, k)^2;
        end
    end
    rms = sqrt(sum/(10*100));
    FeatureA(:,:,k) = FeatureA(:,:,k) / rms;
end

FeatureB = zeros(10, 100, 20);
for i = 1:10
    input = strcat('data/B-', num2str(i), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages(input);
    FeatureB(i, :, :) = F;
end

for k = 1:20
    sum = 0;
    for i = 1:10
        for j = 1:100
            sum = sum + FeatureB(i, j, k)^2;
        end
    end
    rms = sqrt(sum/(10*100));
    FeatureB(:,:,k) = FeatureB(:,:,k) / rms;
end

FeatureC = zeros(10, 100, 20);
for i = 1:10
    input = strcat('data/C-', num2str(i), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages(input);
    FeatureC(i, :, :) = F;
end

for k = 1:20
    sum = 0;
    for i = 1:10
        for j = 1:100
            sum = sum + FeatureC(i, j, k)^2;
        end
    end
    rms = sqrt(sum/(10*100));
    FeatureC(:,:,k) = FeatureC(:,:,k) / rms;
end

FeatureD = zeros(10, 100, 20);
for i = 1:10
    input = strcat('data/D-', num2str(i), '-pre.txt');
    [L, h, w, max, may, F] = readLetterImages(input);
    FeatureD(i, :, :) = F;
end

for k = 1:20
    sum = 0;
    for i = 1:10
        for j = 1:100
            sum = sum + FeatureD(i, j, k)^2;
        end
    end
    rms = sqrt(sum/(10*100));
    FeatureD(:,:,k) = FeatureD(:,:,k) / rms;
end
end