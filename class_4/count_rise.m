clc;clear;close all;
ori_img = imread("rice.png");

% img = mean_filter(ori_img, 5);

img = double(ori_img);

[R, C] = size(img);
result = zeros([R, C]);

temp = zeros(R, 255);
for i = 1:R
    for j = 1:C
        aa = img(i, j);
        temp(i, aa) = temp(i, aa) + 1;
    end
end

row_mean = mean(img, 1);
row_std = std(img, 0, 1);
for i = 1:R
    result(i, :) = (img(i, :) - row_mean(i)) / row_std(i);
end
% result = result + abs(min(result, [], "all"));
% result = result * (255 / max(result, [], "all"));
% 
% 
% temp = zeros(R, 255);
% for i = 1:R
%     for j = 1:C
%         aa = img(i, j);
%         temp(i, aa) = temp(i, aa) + 1;
%     end
% end

% binary
% row_mean = mean(img, 2);
% for i = 1:R
%     temp = img(i, :);
%     result(i, temp > row_mean(i, 1)) = 255;
% end
% binary - end

% delete small item


subplot(1, 2, 1), imshow(uint8(result));
subplot(1, 2, 2), imshow(ori_img);