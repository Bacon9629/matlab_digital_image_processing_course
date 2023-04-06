clc;clear;close all;
ori_i = imread('eye.jpg');
ori_w = imread('eye_mask_2.jpg');

i = rgb2gray(ori_i);
w = rgb2gray(ori_w);
[RR, CC] = size(w);
time_s = 2;
summ = 0;
while summ < time_s
    i = impyramid(i, 'reduce');
    w = impyramid(w, 'reduce');
    summ = summ + 1;
end
[Icorr, target_y, target_x, c] = imcorr(i, w);

figure();
imshow(ori_i);
rectangle('Position',[target_x * 2^(time_s), target_y * 2^(time_s), RR, CC]);


