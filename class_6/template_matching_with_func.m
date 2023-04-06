clc; clear; close all;
onion = im2gray(imread('onion.png'));
peppers = im2gray(imread('peppers.png'));
figure;subplot(221);imshow(onion);
figure;subplot(222);imshow(peppers);tic;
c = normxcorr2(onion, peppers);toc;
tic;GPUonion = gpuArray(onion);
GPUpeppers = gpuArray(peppers);
cc = normxcorr2(GPUonion, GPUpeppers);
c = gather(cc);toc;
subplot(223);surf(c);shading
flat;view([0, 90]);
[ypeak, xpeak] = find(c == max(c(:)));
yoffset = ypeak-size(onion, 1);
xoffset = ypeak-size(onion, 2);
subplot(224);imshow("peppers.png")
drawrectangle(gca, 'Position',[xoffset, yoffset, size(onion, 2), size(onion, 1)], 'FaceAlpha',0)