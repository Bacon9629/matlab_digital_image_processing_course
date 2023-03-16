clc;clear;close all;

img = imread("a.jpg");
img = im2gray(img);


WIDTH = 210;

% for i=1:1
%     imresize(img, [WIDTH*dim(1)/dim(2) WIDTH], 'bicubic');
% end

img_imadjust = imadjust(img);
img_histeq = histeq(img);
img_adap = adapthisteq(img);

figure, imshow(img);
title("ori_img");

figure, imshow(img_histeq);
title("img_histeq");

figure, imshow(img_adap);
title("img_adap");
