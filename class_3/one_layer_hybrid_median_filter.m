clc;clear;close all;

img = imread("coins.png");
img = im2gray(img);
img = imnoise(img, "gaussian");

FILTER_SIZE = 9;

[R, C] = size(img);
result1 = zeros([R, C]);
result2 = zeros([R, C]);
result3 = zeros([R, C]);
result_z = zeros([R, C]);


% filter 1 - start
tic

padding_size = (FILTER_SIZE-1)/2;
region_size = FILTER_SIZE * FILTER_SIZE;
for r=1+padding_size:R-padding_size
    for c=1+padding_size:C-padding_size
        region = zeros([2, FILTER_SIZE]);
        region(1, :) = reshape(img(r-padding_size:r+padding_size, c), [1, FILTER_SIZE]);
        region(2, :) = reshape(img(r, c-padding_size:c+padding_size), [1, FILTER_SIZE]);
        
        pixel = median(region,"all");
        result1(r, c) = pixel;
    end
end
result1(1, :) = result1(2, :);
result1(end, :) = result1(end - 1, :);
result1(:, 1) = result1(:, 2);
result1(:, end) = result1(:, end - 1);

result1 = uint8(result1);
toc
% filter 1 - end


% filter 2 - start
tic

padding_size = (FILTER_SIZE-1)/2;
region_size = FILTER_SIZE * FILTER_SIZE;
for r=1+padding_size:R-padding_size
    for c=1+padding_size:C-padding_size
%         region = zeros([2, FILTER_SIZE]);
        a = img(r, c-padding_size + 1:2:c+padding_size);
        b = img(r, c-padding_size:2:c+padding_size);

        region = [a b];

%         region(1, :) = reshape(img(r, c-padding_size + 1:2:c+padding_size), [1, FILTER_SIZE]);
%         region(2, :) = reshape(img(r, c-padding_size:2:c+padding_size), [1, FILTER_SIZE]);
        
        pixel = median(region,"all");
        result2(r, c) = pixel;
    end
end
result2(1, :) = result2(2, :);
result2(end, :) = result2(end - 1, :);
result2(:, 1) = result2(:, 2);
result2(:, end) = result2(:, end - 1);

result2 = uint8(result2);
toc
% filter 2 - end


% filter 3 - start
tic
result3 = img;
% padding_size = (FILTER_SIZE-1)/2;
% region_size = FILTER_SIZE * FILTER_SIZE;
% for r=1+padding_size:R-padding_size
%     for c=1+padding_size:C-padding_size
% %         region = zeros([2, FILTER_SIZE]);
%         a = img(r, c-padding_size + 1:2:c+padding_size);
%         b = img(r, c-padding_size:2:c+padding_size);
% 
%         region = [a b];
% 
% %         region(1, :) = reshape(img(r, c-padding_size + 1:2:c+padding_size), [1, FILTER_SIZE]);
% %         region(2, :) = reshape(img(r, c-padding_size:2:c+padding_size), [1, FILTER_SIZE]);
%         
%         pixel = median(region,"all");
%         result2(r, c) = pixel;
%     end
% end
result3(1, :) = result3(2, :);
result3(end, :) = result3(end - 1, :);
result3(:, 1) = result3(:, 2);
result3(:, end) = result3(:, end - 1);

result3 = uint8(result3);
toc
% filter 3 - end

temp = zeros(R, C, 3);
temp(:, :, 1) = result1;
temp(:, :, 2) = result2;
temp(:, :, 3) = result3;
result_z = median(temp, [3]);


figure("Name", "ori");
imshow(img);

figure("Name", "1");
imshow(result1);

figure("Name", "2");
imshow(result2);

figure("Name", "3");
imshow(result3);

figure("Name", "result");
imshow(result_z);

