[L1, h1, w1, F1] = readLetterImages2('HW2\HW2_data_c_1.txt');
[L2, h2, w2, F2] = readLetterImages2('HW2\HW2_data_e_1.txt');

size = 200;
dimension = 500;

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

figure(1);
bar(H1, 'r');

hold on;
bar(H2, 'b');
hold off;
xlim([100 500]);

min = 1;
for t = 1:dimension-1
    t_c = sum(H1(1:t));
    f_c = sum(H1(t + 1: end));
    t_e = sum(H2(t + 1: end));
    f_e = sum(H2(1:t));
    precision = ((f_c / (t_c + f_c)) + (f_e / (t_e + f_e))) * 0.5;
    if (precision < min) 
        min = precision; % average error rate
        T = t; % boundary
    end
end

t = T;
t_c = sum(H1(1:t));
f_c = sum(H1(t + 1: end));
t_e = sum(H2(t + 1: end));
f_e = sum(H2(1:t));