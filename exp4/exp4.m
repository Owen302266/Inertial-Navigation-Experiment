%% exp4
clc
clear
close all
%% import data
glvs
ts = 0.01;
load 'imurlg002.mat';
imuNav(:,1) = imu(1:1200/ts,1);
STIM300 = load('stim300.txt');
imuNav(:,2) = STIM300(1:1200/ts,1)*glv.dps*ts;
load('sysclbt_imu.mat');
imuNav(:,3) = imu(1:600/ts,1);
%% use code of Gongmin Yan
avars(imuNav(:,1:3)/ts/glv.dph,ts);
