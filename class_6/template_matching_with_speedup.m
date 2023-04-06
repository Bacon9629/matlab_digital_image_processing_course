clc;clear;close all;
ori_i = im2gray(imread('eye.jpg')) ;
w = im2gray(imread('eye_mask_2.jpg'));
% ori_i = imnoise(ori_i, 'salt & pepper', 0.02);
[m, n] = size(ori_i);
[RR, CC] = size(w);
C = zeros(m, n);

i = double(ori_i);
F = fft2(i);
W = conj(fft2(w, m, n));
Ffilt = F.*W;
IIcorr = real(ifft2(Ffilt));

cc = max(IIcorr(:));
[iiMax, jjMax] = find(IIcorr == cc);
% figure();
% imshow(ori_i);
% rectangle('Position',[jjMax(0), iiMax(0), RR, CC]);

[Icorr, iMax, jMax, c] = imcorr(ori_i, w);

% for i=1:m
%     for j=1:n
% 
%         aa = double(ori_i);
%         F = fft2(aa);
%         W = conj(fft2(w, m, n));
%         Ffilt = W.*F;
%         IIcorr = real(ifft2(Ffilt));
% 
%     end
% end