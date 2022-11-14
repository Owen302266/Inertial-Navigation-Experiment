%% exp3
clc
clear
close all
%% import data
filename = 'D:\CoderLife\Inertial-Navigation-Experiment\exp3\3-6.txt'; 
testdata = importdata(filename);
%% data transform
[M, N] = size(testdata);
Pitch(:) = testdata.data(:, 14);
Roll(:) = testdata.data(:, 15);
Yaw(:) = testdata.data(:, 16);
q = testdata.data(:, 17:20);
ang_cov = @(x)x * 180 / pi;
beta = 3.37;
%% calculate
% matrix parameters
C32 = 2 * (q(:,3).*q(:,4) + q(:,1).*q(:,2));
C33 = q(:,1).^2 - q(:,2).^2 - q(:,3).^2 + q(:,4).^2;
C31 = 2 * (q(:,2).*q(:,4) - q(:,1).*q(:,3));
C11 = q(:,1).^2 + q(:,2).^2 -q(:,3).^2 - q(:,4).^2;
C21 = 2 * (q(:,2).*q(:,3) + q(:,1).*q(:,4));
Theta = ang_cov(asin(-C31));
Phi = ang_cov(atan2(C32, C33));
Psai = ang_cov(atan2(C21, C11));
%% plot figure
figure(1)
title('Pitch')
plot(Pitch(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Theta(:), 'Color', 'r', 'Linewidth', 1)
legend('Pitch', 'Theta')
% print('Pitch3_6', '-dpng')
figure(2)
title('Roll')
plot(Roll(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Phi(:), 'Color', 'r', 'Linewidth', 1)
legend('Roll', 'Phi')
% print('Roll3_6', '-dpng')
figure(3)
title(Psai)
plot(Yaw(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Psai(:), 'Color', 'r', 'Linewidth', 1)
legend('Yaw', 'Psai')
% print('Yaw3_6', '-dpng')