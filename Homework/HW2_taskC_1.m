function [T, FC, TC, FE, TE, P] = HW2_taskC_1()
size = 200;
dimension = 1000;

T(1:10) = 0;
TC(1:10) = 0;
FC(1:10) = 0;
TE(1:10) = 0;
FE(1:10) = 0;
P(1:10) = 0;

for test = 10:-1:1
    % training process
    H1(1:dimension) = 0;
    for k = 1:10
        if (k ~= test)
            file1 = strcat('HW2\HW2_data_c_', num2str(k), '.txt');
            [L, h, w, F1] = readLetterImages2(file1);

            Feature1 = F1(:, 4); % top_heavy
            for i = 1:size
                H1(Feature1(i)) = H1(Feature1(i)) + 1;
            end
        end
    end
    
    H2(1:dimension) = 0;
    for k = 1:10
        if (k ~= test)
            file2 = strcat('HW2\HW2_data_e_', num2str(k), '.txt');
            [L, h, w, F2] = readLetterImages2(file2);

            Feature2 = F2(:, 4);
            for i = 1:size
                H2(Feature2(i)) = H2(Feature2(i)) + 1;
            end
        end
    end
    
    min = 1;
    Thr = 0;
    for t = 1:dimension-1
        t_c = sum(H1(1:t));
        f_c = sum(H1(t + 1: end));
        t_e = sum(H2(t + 1: end));
        f_e = sum(H2(1:t));
        precision = ((f_c / (t_c + f_c)) + (f_e / (t_e + f_e))) * 0.5;
        if (precision < min) 
            min = precision; % average error rate
            Thr = t; % boundary
        end
    end

    % testing process
    H1(1:dimension) = 0;
    file1 = strcat('HW2\HW2_data_c_', num2str(test), '.txt');
    [L, h, w, F1] = readLetterImages2(file1);
    Feature1 = F1(:, 4); % top_heavy
    for i = 1:size
        H1(Feature1(i)) = H1(Feature1(i)) + 1;
    end
    
    H2(1:dimension) = 0;
    file2 = strcat('HW2\HW2_data_e_', num2str(test), '.txt');
    [L, h, w, F2] = readLetterImages2(file2);
    Feature2 = F2(:, 4);
    for i = 1:size
    	H2(Feature2(i)) = H2(Feature2(i)) + 1;
    end
    
    T(test) = Thr;
    TC(test) = sum(H1(1:T(test)));
    FC(test) = sum(H1(T(test) + 1: end));
    TE(test) = sum(H2(T(test) + 1: end));
    FE(test) = sum(H2(1:T(test)));
    P(test) = ((FC(test) / (TC(test) + FC(test))) + (FE(test) / (TE(test) + FE(test)))) * 0.5;
end
end