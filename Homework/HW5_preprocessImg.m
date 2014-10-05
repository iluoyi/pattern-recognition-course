for i = 1:10
    input = strcat('HW5\A-', num2str(i-1), '.txt');
    output = strcat('HW5\A-', num2str(i-1), '-pre.txt');
    preprocessImg(input, output);
end

for i = 1:10
    input = strcat('HW5\B-', num2str(i-1), '.txt');
    output = strcat('HW5\B-', num2str(i-1), '-pre.txt');
    preprocessImg(input, output);
end