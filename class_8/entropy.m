clc;clear;close all;
I = imread('coins.png');

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
I = imfilter(I, PSF, 'conv', 'circular');

figure;subplot(141);imshow(I);title("I");
p = imhist(I(:));
subplot(142);bar(p), title('p');

%% reomve zero entries in p

p(p==0) = [];
subplot(143);bar(p), title("P");

%% normalize p so that sum(p) is one
p = p ./ numel(I);
subplot(144); bar(p); title('p');
E = -sum(p.*log2(p));