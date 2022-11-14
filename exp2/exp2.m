%% exp2
clc
clear
close all
%% import data
filename = 'D:\CoderLife\Inertial-Navigation-Experiment\exp2\2-6.txt'; 
testdata = importdata(filename);
%% data transform
[M, N] = size(testdata);
AccX(:) = testdata.data(:, 2);
AccY(:) = testdata.data(:, 3);
AccZ(:) = testdata.data(:, 4);
AngVX(:) = testdata.data(:, 5);
AngVY(:) = testdata.data(:, 6);
AngVZ(:) = testdata.data(:, 7);
MagX(:) = testdata.data(:, 8);
MagY(:) = testdata.data(:, 9);
MagZ(:) = testdata.data(:, 10);
NormMagX(:) = testdata.data(:, 11);
NormMagY(:) = testdata.data(:, 12);
NormMagZ(:) = testdata.data(:, 13);
Pitch(:) = testdata.data(:, 14);
Roll(:) = testdata.data(:, 15);
Yaw(:) = testdata.data(:, 16);
ang_cov = @(x)x * 180 / pi;
beta = 3.37;
%% calculate
% theta and phi calculated in exp1
Theta(:) = -atan(AccX ./ sqrt(AccY.* AccY + AccZ.*AccZ));
Phi(:) = atan2(AccY, AccZ);
% 2-1~2-6
Hx = MagX.*cos(Phi) + MagY.*sin(Theta).*sin(Phi) - MagZ.*cos(Theta).*sin(Phi);
Hy = MagX.*cos(Theta) + MagZ.*sin(Theta);
Psai = ang_cov(atan2(Hy, Hx)) + beta;
%% plot figure
figure(1)
title(Psai)
plot(Yaw(:), 'Color', 'b', 'Linewidth', 2)
hold on
plot(Psai(:), 'Color', 'r', 'Linewidth', 1)
legend('Yaw', 'Psai')
% print('Yaw2_6', '-dpng')


