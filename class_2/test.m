clc;clear;close all;
a = zeros([5, 5]);
parfor i=1:5
    for j=1:5

        a(i, j) = i + j;

    end
end

display(a)
