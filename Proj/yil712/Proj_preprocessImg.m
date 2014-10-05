%for i = 1:10
    %input = strcat('data\A-', num2str(i-1), '.txt');
    %output = strcat('data\A-', num2str(i-1), '-pre.txt');
%    preprocessImg(input, output);
%end

fileList = getAllFiles('data/');
len = size(fileList);

count = 1;
for i = 1:len
    if (count > 10)
        count = count - 10;
    end
    input = fileList{i}; % an element of a string array {}
    output = strcat(input(1:7), num2str(count), '-pre.txt');
    preprocessImg(input, output);
    count = count + 1;
end