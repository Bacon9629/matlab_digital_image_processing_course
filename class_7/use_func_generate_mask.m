clc;clear;close all;
img = rgb2gray(imread('peppers.png'));

f = fft2(double(img));
s = fftshift(log(1+abs(f)));

d0=50;d1=100;n=10;
mask = butterworthbpf(img, d0, d1, n);
