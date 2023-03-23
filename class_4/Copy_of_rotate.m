clc;clear;close all;

pout = imread("ngc6543a.jpg");
% pout = imread("coins.png");
[R, C, CH] = size(pout);

ANGLE = -10;

alfa = ANGLE * pi / 180.0;
% x_offset = 0;
% y_offset = 0;
tras = [
    cos(alfa) -sin(alfa) 0
    sin(alfa) cos(alfa) 0
    0 0 1
    ];


br_corner = uint16(tras * [R; C; 1]);  % bottom right
bl_corner = uint16(tras * [R; 1; 1]);  % bottom left
tr_corner = uint16(tras * [1; C; 1]);

index = zeros([R, C, 2]);  % 儲存原圖mapping到新圖座標

for i = 1 : R
    for j = 1 : C
        temp = tras * [i; j; 1];
        index(i, j, :) = int16(temp(1:2, 1));    
    end
end

% padding
temp = min(index(1, :, 1));
if temp <= 0
    index(:, :, 1) = index(:, :, 1) - temp + 1;
end

temp = min(index(:, 1, 2));
if temp <= 0
    index(:, :, 2) = index(:, :, 2) - temp + 1;
end
% padding - end

% copy pixel
res = zeros([index(1, end, 1), index(end, 1, 2), CH]);
for r = 1 : R
    for c = 1 : C
        temp = index(r, c, :);
        new_y = temp(1);
        new_x = temp(2);

        res(new_y, new_x, :) = pout(r, c, :);
    end
end
% copy pixel - end

subplot(1, 2, 1), imshow(pout);
subplot(1, 2, 2), imshow(uint8(res));
