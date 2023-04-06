clc;clear;close all;
i = imread('eye.jpg');
w = imread('eye_mask.jpg');
i = rgb2gray(i);
w = rgb2gray(w);
time_s = 0;
summ = 0;
while summ < time_s
    i = impyramid(i, 'reduce');
    w = impyramid(w, 'reduce');
    summ = summ + 1;
end
[Icorr, iMaxRes, jMaxRes, c] = imcorr(i, w);


