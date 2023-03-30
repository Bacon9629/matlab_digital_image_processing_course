clc;clear;close all;
I = imread("rice.png");
BG = imopen(I, strel("disk", 15));
I2 = imsubtract(I, BG);level = graythresh(I2);
bw = im2bw(I2, level);

ObjI = bwselect(bw);
imshow(ObjI);