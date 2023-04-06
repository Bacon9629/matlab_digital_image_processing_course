clc;clear;close all;
% I = imread("eye.jpg");
I = imread("onion.png");
I = rgb2gray(I);
figure
imshow(I);
% w=imread('eye_mask_2.jpg');
w=I(30:50, 50:70);
% w = rgb2gray(w);
figure
imshow(w)

[Icorr, iMaxRes, jMaxRes, c] = imcorr(I, w);