function [confusion5] = Proj_classifierP5(FeatureA, FeatureB)

confusion5(1:10, 1:10) = 0;

train_data = ones(1000, 256);
row = 0;
for c = 1:10 % for each class
    for i = 1:100 % to classify each image
        row = row + 1;
        for k = 1:256 % feature
            train_data(row, k) = FeatureA(c, i, k);
        end
    end
end
train_label = [ones(100, 1); ones(100, 1)*2; ones(100, 1)*3; ...
            ones(100, 1)*4; ones(100, 1)*5; ones(100, 1)*6; ...
            ones(100, 1)*7; ones(100, 1)*8; ones(100, 1)*9; ones(100, 1)*10];
model = svmtrain(train_label, train_data, '-s 0 -c 1 -t 0');

test_data = ones(1000, 256);
row = 0;
for c = 1:10 % for each class
    for i = 1:100 % to classify each image
        row = row + 1;
        for k = 1:256 % feature
            test_data(row, k) = FeatureB(c, i, k);
        end
    end
end
test_label = [ones(100, 1); ones(100, 1)*2; ones(100, 1)*3; ...
            ones(100, 1)*4; ones(100, 1)*5; ones(100, 1)*6; ...
            ones(100, 1)*7; ones(100, 1)*8; ones(100, 1)*9; ones(100, 1)*10];
[predict_label, accuracy, dec_values] = svmpredict(test_label, test_data, model);

index = 0;
for real = 1:10
    for i = 1:100 % images
        index = index + 1;
        classified = predict_label(index);
        confusion5(real, classified) = confusion5(real, classified) + 1;
    end
end