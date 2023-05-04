clc;clear;close all;
%% load data
x1 = imread('pout.tif');
x2 = flipdim(x1, 2);
x3 = imrotate(x1, 3);
x4 = imrotate(x1, -3);
x3 = imresize(x3, [291, 240]);
x4 = imresize(x4, [291, 240]);
figure, subplot(151);imshow(x1);
subplot(152);imshow(x2);
subplot(153);imshow(x3);
subplot(154);imshow(x4);
[w, h] = size(x2);
x1 = im2double(x1);
x2 = im2double(x2);
x3 = im2double(x3);
x4 = im2double(x4);
subplot(154);
imshow(double(x1+x2+x3+x4)/2);
x(1, :) = x1(:); x(2, :) = x2(:);
x(3, :) = x3(:); x(4, :) = x4(:);
%% PCA
Cx = (x*x' - mean(x(1, :)))/(w*h);
[U, lada] = eig(Cx);
y = U'*x;
PCA_image = reshape(y(4, :)+y(2, :)+y(1, :), [w, h]);
subplot(155), imshow(PCA_image);







