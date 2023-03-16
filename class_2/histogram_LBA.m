clc;clear;close all;

img = imread("a.jpg");
% r2l = makeform('srgb2lab');
% l2s = makeform('lab2srgb');

MAX_L = 100;

temp = rgb2lab(img);

L = temp(:, :, 1) / MAX_L;
temp(:, :, 1) = histeq(L) * MAX_L;


temp = uint8(lab2rgb(temp)*255);



WIDTH = 210;

% for i=1:1
%     imresize(img, [WIDTH*dim(1)/dim(2) WIDTH], 'bicubic');
% end
% 
% img_imadjust = imadjust(img);
% img_histeq = histeq(img);
% img_adap = adapthisteq(img);

figure, imshow(img);
title("ori_img");

figure, imshow(temp);
title("img_adap");

