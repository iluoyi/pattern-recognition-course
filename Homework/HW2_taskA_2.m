num = 10;
F(1:num, 1:2) = 0;
P(1:num) = 0;

for i = 1:10
    file1 = strcat('HW2\HW2_data_c_', num2str(i), '.txt');
    file2 = strcat('HW2\HW2_data_e_', num2str(i), '.txt');
    [F(i, 1), F(i, 2), P(i)] = HW2_taskA_2_1(file1, file2, 200, 1000, 222);
end

mean = mean(P(2:10));
std = std(P(2:10));