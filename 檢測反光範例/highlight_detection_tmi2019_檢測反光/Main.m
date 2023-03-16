clear;close all;clc;
%% FROM
% https://github.com/fu123456/SHDNet
%%
%img=im2double(imread('data/03449.png'));
%img=im2double(imread('data/03043.png'));
img=im2double(imread('data/520835098_m.jpg'));

% The two parameters are key to obtain better masks.
% Different values of Ts and Tv are often set to produce good results.
% Ts is the threshold value for Saturation channel; Tv is the threshold value for
% Value channel.
% If you want to obtain better results, please modify the following parameters by yourself.
% Ts=0.35;
% Tv=0.85;
Ts=0.35;Tv=0.9;
mask=sh_detection(img,Ts,Tv);

% show result
figure(1);
subplot(131);imshow(img);
title('input image');
subplot(132);imshow(mask);
title('mask map');
%% im2bw
BW=im2bw(mask);
subplot(133);imshow(BW);
title('BW map');
% save results
% imwrite(mask,'/home/fg/Nutstore_files/Nutstore/ACMMM2020/images/results_on_testing_dataset/results/tmi2019/00079_temp.png');
