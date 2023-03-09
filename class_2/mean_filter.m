clc;clear;close all;
ori_img = imread("a.jpg");
img = imnoise(ori_img, "gaussian");

% mean filter - start
tic
FILTER_SIZE = 9;
[R, C, CHANNEL] = size(img);
result = zeros([R, C]);

padding_size = (FILTER_SIZE-1)/2;
region_size = CHANNEL * FILTER_SIZE * FILTER_SIZE;
for r=1+padding_size:R-padding_size
    for c=1+padding_size:C-padding_size

        region = img(r-padding_size:r+padding_size, c-padding_size:c+padding_size, :);
        pixel = sum(region,"all") / region_size;
        result(r, c) = pixel;
    end
end
result = uint8(result);
toc
% mean filter - end


% result = immultiply(img, 5);





subplot(1, 2, 1);imshow(ori_img)
subplot(1, 2, 2);imshow(result)

