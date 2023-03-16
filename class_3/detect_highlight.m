clc;clear;close all;

img = imread("onion.png");
img = im2double(img);
[h, w, ~] = size(img);

% img = im2gray(img);

hsv = rgb2hsv(img);
hue = hsv(:, :, 1);
saturation = hsv(:, :, 2);
value = hsv(:, :, 3);

Ts = 0.35;
Tv = 0.85;

Ts = repmat(Ts, [h, w]);
Tv = repmat(Tv, [h, w]);

highlight_mask1 = (1-exp((-2*max(Ts-saturation, 0).^2)/(0.01)));
highlight_mask2 = (1-exp((-2*max(value-Tv, 0).^2)/(0.01)));

hightlight_mask = highlight_mask1 .* highlight_mask2;

subplot(1, 2, 1);
imshow(img);

subplot(1, 2, 2);
imshow(hightlight_mask);