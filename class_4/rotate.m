clc;clear;close all;

pout = imread("pout.tif");
[R, C] = size(pout);
alfa = -15 * pi / 180.0;
tras = [
    cos(alfa) -sin(alfa) 0;
    sin(alfa) cos(alfa) 0;
    0 0 1
    ];


a = uint16(tras * [R; C; 1]);
new_r = a(1, 1) + 1;
new_c = a(2, 1) + 1;
res = zeros(new_r, C);

for i = 1 : R
    for j = 1 : C
    temp = [i; j; 1];
    temp = tras * temp;
    x = uint16(temp(1, 1));
    y = uint16(temp(2, 1));

    if (x <= new_r) && (y <= new_c) && (x >= 1) && (y >= 1)
        res(x, y) = pout(i, j);
    end
    
    
    end


end
imshow(uint8(res))
