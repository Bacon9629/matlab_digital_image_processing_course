clc;clear;close all;

img = imread("ngc6543a.jpg");
% pout = imread("coins.png");
[R, C, CH] = size(img);

ANGLE = -10;
sh_x = 0.2;
sh_y = 0;

alfa = ANGLE * pi / 180.0;
rotate_trans = [
    cos(alfa) -sin(alfa) 0
    sin(alfa) cos(alfa) 0
    0 0 1
    ];
shear_trans = [
    1 sh_y 0
    sh_x 1 0
    0 0 1
    ];

index = zeros([R, C, 2]);  % 儲存原圖mapping到新圖座標
for i = 1 : R
    for j = 1 : C
        index(i, j, :) = [i, j];
          
    end
end

% rotate
for i = 1 : R
    for j = 1 : C
        te = index(i, j, :);
        temp = rotate_trans * [te(1); te(2); 1];
        index(i, j, :) = temp(1:2, 1);    
    end
end
% rotate - end

% shear
for i = 1 : R
    for j = 1 : C
        te = index(i, j, :);
        temp = shear_trans * [te(1); te(2); 1];
        index(i, j, :) = temp(1:2, 1);    
    end
end
% shear - end

% padding(adapt width and high of image)
index = int16(index);
temp = min(index(1, :, 1));
if temp <= 0
    index(:, :, 1) = index(:, :, 1) - temp + 1;  % padding row(y)
end

temp = min(index(:, 1, 2));
if temp <= 0 
    index(:, :, 2) = index(:, :, 2) - temp + 1;  % padding col(x)
end
% padding - end

% copy pixel
res = zeros([index(1, end, 1), index(end, 1, 2), CH]);
for r = 1 : R
    for c = 1 : C
        temp = index(r, c, :);
        new_y = temp(1);
        new_x = temp(2);

        res(new_y, new_x, :) = img(r, c, :);
    end
end
% copy pixel - end

figure();
subplot(1, 2, 1), imshow(img);
subplot(1, 2, 2), imshow(uint8(res));
