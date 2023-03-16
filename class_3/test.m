clc;clear;close all;

a = 1:27;
a = reshape(a, [3, 3, 3]);

b = median(a, 3);