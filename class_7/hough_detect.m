clc;clear;close all;
img_gray = imread("circuit.tif");
edges = edge(img_gray, 'canny');

% custom implementation of hough transform

[H, theta, rho] = costom_hough_transform(edges);


function [H, theta, rho] = costom_hough_transform(edges)
    [M, N] = size(edges);
    theta = -90:1:89;
end