clc;clear;close all;
I = imread("rice.png"); level = graythresh(I);
bw = im2bw(I, level); subplot(1, 2, 1);
imshow(bw); BG = imopen(I, strel("disk", 15));
I2 = imsubtract(I, BG);level = graythresh(I2);
bw2 = im2bw(I2, level);
subplot(1, 2, 2);imshow(bw2);

[B, L, N, abs] = bwboundaries(bw2);
hold on;
colors = ['b', 'g', 'r', 'c', 'm', 'y'];
for k=1:length(B)
    boundary = B{k};
    cidx = mod(k, length(colors)) + 1;
    plot(boundary(:, 2), boundary(:, 1), colors(cidx), 'LineWidth', 2);
    rank = 10;
    rndRow = ceil(length(boundary)/(mod(rank*k, 7)+1));
    col = boundary(rndRow, 2);row = boundary(rndRow, 1);
    h = text(col+1, row-1, num2str(L(row, col)));
    set(h, 'Color', colors(cidx), 'FontSize', 14, 'FontWeight', 'bold');

end

