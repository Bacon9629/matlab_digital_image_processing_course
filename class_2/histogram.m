clc;clear;close all;

ori_img = imread("a.jpg");
result = histeq(ori_img);

subplot(2, 2, 1);
imshow(ori_img);

subplot(2, 2, 3);
imhist(ori_img);

subplot(2, 2, 2);
imshow(result);

subplot(2, 2, 4);
imhist(result);

