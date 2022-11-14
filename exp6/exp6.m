%% exp6
clc
clear
close all
%% import data
file1 = 'D:\CoderLife\Inertial-Navigation-Experiment\exp6\6-1.txt'; % 0deg
file2 = 'D:\CoderLife\Inertial-Navigation-Experiment\exp6\6-2.txt'; % 180deg
file3 = 'D:\CoderLife\Inertial-Navigation-Experiment\exp6\6-3.txt'; % 0deg

testdata1 = importdata(file1);
testdata2 = importdata(file2);
testdata3 = importdata(file3);
% data correction
testdata1_corr = rmoutliers(testdata1.data);
testdata2_corr = rmoutliers(testdata2.data);
testdata3_corr = rmoutliers(testdata3.data);
len = length(testdata3_corr);
data10(:, 1) = zeros(floor(len / 10), 1);
data100(:, 1) = zeros(floor(len / 100), 1);
data10_corr(:, 1) = zeros(floor(len / 10), 1);
data100_corr(:, 1) = zeros(floor(len / 100), 1);
%% calculate with correction
% table1
omega1_corr = mean(testdata1_corr);
omega2_corr = mean(testdata2_corr); 
B0_corr = (omega2_corr + omega1_corr) / 2;
% table2
omega3_corr = mean(testdata3_corr);
Bs_1_corr = std(testdata3_corr); % 1s
for i = 1:10:len
    if i+9 <= len
        data10_corr(i) = mean(testdata3_corr(i : i+9));
    else
        data10_corr(i) = mean(testdata3_corr(i : len));
    end
end
data10_corr = nonzeros(data10_corr);
Bs_10_corr = std(data10_corr); % 10s
for i = 1:100:len
    if i+99 <= len
        data100_corr(i) = mean(testdata3_corr(i : i+99));
    else
        data100_corr(i) = mean(testdata3_corr(i : len));
    end
end
data100_corr_cal = nonzeros(data100_corr);
Bs_100_corr = std(data100_corr_cal); % 100s
%% calculate without correction
% table1
omega1 = mean(testdata1.data);
omega2 = mean(testdata2.data); 
B0 = (omega2 + omega1) / 2;
% table2
omega3 = mean(testdata3.data);
Bs_1 = std(testdata3.data); % 1s
for i = 1:10:len
    if i+9 <= len
        data10(i) = mean(testdata3.data(i : i+9));
    else
        data10(i) = mean(testdata3.data(i : len));
    end
end
data10_corr = nonzeros(data10);
Bs_10 = std(data10_corr); % 10s
for i = 1:100:len
    if i+99 <= len
        data100(i) = mean(testdata3.data(i : i+99));
    else
        data100(i) = mean(testdata3.data(i : len));
    end
end
data100_cal = nonzeros(data100);
Bs_100 = std(data100_cal); % 100s






