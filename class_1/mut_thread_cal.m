clc;clear;close all;

tic
z = 20;
a = zeros(z);

parfor i = 1:z
    a(i) = max(abs(eig(rand(500))));

end

toc
