clc;clear;close all;
I = imread("eye.jpg");
I = rgb2gray(I);
figure
imshow(I);
w=imread('eye_mask_2.jpg');
w = rgb2gray(w);
figure
imshow(w)

[Icorr, iMaxRes, jMaxRes, c] = imcorr(I, w);