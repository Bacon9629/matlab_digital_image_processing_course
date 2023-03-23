clc;clear;close all;

pout = imread("pout.tif");
[R, C] = size(pout);

ANGLE = 0;
SHX = 0.5;
SHY = 0.3;

alfa = ANGLE * pi / 180.0;
tras = [
    cos(alfa) -sin(alfa) 0;
    sin(alfa) cos(alfa) 0;
    0 0 1
    ];

shear_tras = [
    1, SHY, 0;
    SHX, 1, 0;
    0, 0, 1;
];

res = zeros(R, C);
res2 = zeros(R, C);

% rotate
for i = 1 : R
    for j = 1 : C
    temp = [i; j; 1];
    temp = tras * temp;
    x = uint16(temp(1, 1));
    y = uint16(temp(2, 1));

    if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
        res(i, j) = pout(x, y);
    end

    end
end


% shear
for i = 1 : R
    for j = 1 : C
    temp = [i; j; 1];
    temp = shear_tras * temp;
    x = uint16(temp(1, 1));
    y = uint16(temp(2, 1));

    if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
        res2(i, j) = res(x, y);
    end
    
    end
end


imshow(uint8(res))
imshow(uint8(res2))
