function [f_c, f_e, precision] = HW2_taskA_2_1(file1, file2, size, dimension, T)
[L1, h1, w1, F1] = readLetterImages2(file1);
[L2, h2, w2, F2] = readLetterImages2(file2);

H1(1:dimension) = 0;
Feature1 = F1(:, 4); % top_heavy
for i = 1:size
    H1(Feature1(i)) = H1(Feature1(i)) + 1;
end

H2(1:dimension) = 0;
Feature2 = F2(:, 4);
for i = 1:size
    H2(Feature2(i)) = H2(Feature2(i)) + 1;
end

t = T;
t_c = sum(H1(1:t));
f_c = sum(H1(t + 1: end));
t_e = sum(H2(t + 1: end));
f_e = sum(H2(1:t));
precision = ((f_c / (t_c + f_c)) + (f_e / (t_e + f_e))) * 0.5;
end