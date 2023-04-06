clc;clear;close all;
ori_i = im2gray(imread('eye.jpg')) ;
ori_i = imnoise(ori_i, 'salt & pepper', 0.02);
w = ori_i(30:70, 90:120);
imshow(w)

[m, n] = size(ori_i);
[RR, CC] = size(w);
C = zeros(m, n);

i = double(ori_i);
F = fft2(i);
W = conj(fft2(w, m, n));
Ffilt = W.*F;
IIcorr = real(ifft2(Ffilt));

cc = max(IIcorr(:));
[iiMax, jjMax] = find(IIcorr == cc);
figure();
imshow(ori_i);
for i=1:size(jjMax, 1)
    rectangle('Position',[jjMax(i), iiMax(i), CC, RR]);
end

[Icorr, iMax, jMax, c] = imcorr(ori_i, w);
