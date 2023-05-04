clc;clear;close all;
%%
addpath('octobos_toolbox');
load('demo_data/noisy_Cameraman_sigma20.mat');
figure,subplot(131);imshow(oracle,[])
subplot(132);imshow(noisy,[])
%%%%%%%%%%%%%%%% OCTOBOS image denoising demo %%%%%%%%%%%%%%%%%%%%%
param.n = 64;
param.stride = 1;
sig=20;
param.sig = sig;           
data.noisy = noisy;
%%data.oracle = oracle;
param.isKmeansInitialization = true;
param.numBlock = 4;
[denoised, transform, outputParam]= OCTOBOS_imagedenoising(data, param);
subplot(133);imshow(denoised, []);
%%
%Pic from http://demo.ipol.im/demo/125/input_select?059_palace.x=58&059_palace.y=38
noisy=double(imread('input_0.png'));
data1=data;data2=data;data3=data;
data1.noisy = noisy(:,:,1);
data2.noisy = noisy(:,:,2);
data3.noisy = noisy(:,:,3);
denoisedRGB=zeros([347 480 3],'double');
for i=1:3
[denoised, ~, ~]= OCTOBOS_imagedenoising(eval(['data' int2str(i)]), param);
denoisedRGB(:,:,i)=denoised;
end
% load dataimage.mat;
figure,subplot(121);imshow(uint8(noisy))
subplot(122);imshow(uint8(denoisedRGB))

% load dataimage.mat