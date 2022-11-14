%% exp7
clc
clear
close all
%% import data
% angle = [120, 240, 0, 0, 120, 240, 180, 180]
testdata1 = importdata('7-1.txt');
testdata2 = importdata('7-2.txt');
testdata3 = importdata('7-3.txt');
testdata4 = importdata('7-4.txt');
testdata5 = importdata('7-5.txt');
testdata6 = importdata('7-6.txt');
testdata7 = importdata('7-7.txt');
testdata8 = importdata('7-8.txt');
% data correction
testdata1_corr = rmoutliers(testdata1.data);
testdata2_corr = rmoutliers(testdata2.data);
testdata3_corr = rmoutliers(testdata3.data);
testdata4_corr = rmoutliers(testdata4.data);
testdata5_corr = rmoutliers(testdata5.data);
testdata6_corr = rmoutliers(testdata6.data);
testdata7_corr = rmoutliers(testdata7.data);
testdata8_corr = rmoutliers(testdata8.data);
% parameters
Phi = 33.42 / 180 * pi; % transformed latitude
omega_e = 15; % deg/h
B0 = 0.6366; % calculated in exp6.m
B0_corr = 0.6479;
%% calculate 
% method 1 
% group 1 (data3)
omega3_corr = mean(testdata3_corr);
alpha1 = 1 / (cos((omega3_corr - B0) ./(omega_e * cos(Phi))));
delta_alpha1 = (B0_corr - B0) / (omega_e * cos(Phi) * sin(alpha1));
% group 2 (data4)
omega4_corr = mean(testdata4_corr);
alpha2 = 1 / (cos((omega4_corr - B0) ./(omega_e * cos(Phi))));
delta_alpha2 = (B0_corr - B0) / (omega_e * cos(Phi) * sin(alpha2));
% method 2
% group 1 [data3, data7]
omega7_corr = mean(testdata7_corr);
B0_1 = (omega3_corr + omega7_corr) / 2;
alpha3 = 1 / cos((omega3_corr - omega7_corr) / (2 * omega_e * cos(Phi)));
delta_alpha3 =  (B0_corr - B0_1) / (sqrt(2) * omega_e * cos(Phi) * sin(alpha3));
% group 2 [data4, data8]
omega8_corr = mean(testdata8_corr); 
B0_2 = (omega4_corr + omega8_corr) / 2;
alpha4 = 1 / cos((omega4_corr - omega8_corr) / (2 * omega_e * cos(Phi)));
delta_alpha4 =  (B0_corr - B0_2) / (sqrt(2) * omega_e * cos(Phi) * sin(alpha4));
% method 3
% group 1 [data1, data2, data3]
omega1_corr = mean(testdata1_corr);
omega2_corr = mean(testdata2_corr);
B0_3 = (omega1_corr + omega2_corr + omega3_corr) / 3;
alpha5 = 1 / tan(sin(pi / 3) / ((omega1_corr - omega3_corr) / (omega2_corr - omega1_corr) + cos(pi / 3)));
delta_alpha5 = sqrt(2 / 3) * (B0_corr - B0_3) / (omega_e * cos(Phi));
% group 2 [data4, data5, data6]
omega5_corr = mean(testdata5_corr);
omega6_corr = mean(testdata6_corr);
B0_4 = (omega4_corr + omega5_corr + omega6_corr) / 3;
alpha6 = 1 / tan(sin(pi / 3) / ((omega5_corr - omega4_corr) / (omega6_corr - omega5_corr) + cos(pi / 3)));
delta_alpha6 = sqrt(2 / 3) * (B0_corr - B0_4) / (omega_e * cos(Phi));