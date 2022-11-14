%% exp1
clc
clear
close all
%% import data
filename = 'D:\CoderLife\Inertial-Navigation-Experiment\exp1\1-6.txt'; 
testdata = importdata(filename);
%% data transform
AccX(:) = testdata.data(:, 2);
AccY(:) = testdata.data(:, 3);
AccZ(:) = testdata.data(:, 4);
Pitch(:) = testdata.data(:, 14);
Roll(:) = testdata.data(:, 15);
Yaw(:) = testdata.data(:, 16);
ang_cov = @(x)x * 180 / pi;
%% calculate
% 1-1~1-6
Theta(:) = ang_cov(-atan2(AccX, sqrt(AccY.* AccY + AccZ.*AccZ)));
Phi(:) = ang_cov(atan2(AccY, AccZ));

%% plot figure
figure(1)
title('Pitch')
plot(Pitch(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Theta(:), 'Color', 'r', 'Linewidth', 1)
legend('Pitch', 'Theta')
% print('Pitch1_3', '-dpng')
figure(2)
title('Roll')
plot(Roll(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Phi(:), 'Color', 'r', 'Linewidth', 1)
legend('Roll', 'Phi')
% print('Ptich1_6', '-dpng')
