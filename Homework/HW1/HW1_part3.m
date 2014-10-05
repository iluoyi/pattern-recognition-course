[L1, h1, w1, F1] = readLetterImages('HW1_c.txt');
[L2, h2, w2, F2] = readLetterImages('HW1_e.txt');

dimension = 100;

H1(1:dimension) = 0;
Feature1 = F1(:, 2);
for i = 1:dimension
    H1(Feature1(i)) = H1(Feature1(i)) + 1;
end

H2(1:dimension) = 0;
Feature2 = F2(:, 2);
for i = 1:dimension
    H2(Feature2(i)) = H2(Feature2(i)) + 1;
end

figure(1);
hist(Feature1);

hold on;
hist(Feature2);
hold off;

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