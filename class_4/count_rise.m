clc;clear;close all;
ori_img = imread("rice.png");
BG = imopen(ori_img, strel('disk', 5));
figure(),imshow(BG);
figure(),imshow(ori_img - BG);

% img = mean_filter(ori_img, 5);

img = double(ori_img);

[R, C] = size(img);
result = zeros([R, C]);

% temp = zeros(R, 255);
% for i = 1:R
%     for j = 1:C
%         aa = img(i, j);
%         temp(i, aa) = temp(i, aa) + 1;
%     end
% end

row_mean = mean(img, 2);
row_std = std(img, 0, 2);
for i = 1:R
    result(i, :) = (img(i, :) - row_mean(i, 1)) / row_std(i, 1);
end
result = result + abs(min(result, [], "all"));
result = result * (255 / max(result, [], "all"));

% binary
% row_mean = mean(result, 2) + 40;
% for i = 1:R
%     temp = result(i, :);
%     result(i, temp > row_mean(i, 1)) = 255;
%     result(i, temp <= row_mean(i, 1)) = 0;
% end
% binary - end

% delete small item

figure();
subplot(1, 2, 1), imshow(uint8(result));
subplot(1, 2, 2), imshow(ori_img);