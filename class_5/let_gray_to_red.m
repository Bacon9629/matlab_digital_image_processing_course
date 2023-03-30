clc;clear;close all;
ori_img = imread("rice.png");
img = double(ori_img);

[R, C] = size(img);
result = zeros([R, C]);

% calculate distribute
% temp = zeros(R, 255);
% for i = 1:R
%     for j = 1:C
%         aa = img(i, j);
%         temp(i, aa) = temp(i, aa) + 1;
%     end
% end
% calculate distribute - end

row_mean = mean(img, 2);
row_std = std(img, 0, 2);
for i = 1:R
    result(i, :) = (img(i, :) - row_mean(i, 1)) / row_std(i, 1);
end
result = result + abs(min(result, [], "all"));
result = result * (255 / max(result, [], "all"));

% binary
row_mean = mean(result, 2) + 40;
for i = 1:R
    temp = result(i, :);
    result(i, temp > row_mean(i, 1)) = 255;
    result(i, temp <= row_mean(i, 1)) = 0;
end
% binary - end

% gray to red
result2 = zeros([R, C, 3]);
result2(:, :, 1) = result(:, :);
% gray to red - end

subplot(1, 2, 1);imshow(result2);
subplot(1, 2, 2);imshow(ori_img);

