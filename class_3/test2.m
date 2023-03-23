clc; clear all; close all;
rand('state', 0);
warning off all;
path([pwd '\\toolbox'], path);
filename = 'Card22.jpg'; % 待处理图像名称
% 载入图像
[I, map, caaa] = imread("Card22.jpg");
% 计算边缘图像
f = 1 - I/255;
% GVF处理
[u,v] = GVF(f, 0.1, 80);
% 正规化处理
mag = sqrt(u.*u+v.*v);
px = u./(mag+1e-10); py = v./(mag+1e-10);
% 显示结果
figure(1);
subplot(1, 2, 1); imdisp(I); title('原图像', 'FontWeight', 'Bold');
subplot(1, 2, 2); imdisp(f); title('边缘图像', 'FontWeight', 'Bold');
% % 初始边缘曲线
% load(sprintf('.\\%s', filename));
% [x,y] = snakeinterp(XSnake,YSnake,2,0.5);
% subplot(1, 2, 1); hold on;
% h = plot(x, y, 'r-');
% % GVF迭代
% load(sprintf('.\\test_%s.mat', filename));
% for i=1:25,
%     [x,y] = snakedeform(x,y,alpha,beta,gamma,kappa,fx,fy,5);
%     [x,y] = snakeinterp(x,y,dmax,dmin);
%     set(h, 'XData', x, 'YData', y);
%     title(['迭代过程，迭代次数为 = ' num2str(i*5)], 'FontWeight', 'Bold')
%     pause(0.2);
% end
% title('GVF Snake边缘提取标记', 'FontWeight', 'Bold')
% mag = sqrt(u.*u+v.*v);
% px = u./(mag+1e-10); py = v./(mag+1e-10);
% % 显示结果
% figure(1);
% subplot(1, 2, 1); imdisp(I); title('原图像', 'FontWeight', 'Bold');
% subplot(1, 2, 2); imdisp(f); title('边缘图像', 'FontWeight', 'Bold');
% % 初始边缘曲线
% load(sprintf('.\\%s.mat', filename));
% [x,y] = snakeinterp(XSnake,YSnake,2,0.5);
% XSnake
% YSnake
% GVF snake (active contour) toolbox
% Version 1.0 17-June-1997
% Copyright (c) 1996-1997 by Chenyang Xu and Jerry L. Prince 
%
%  Image input/output
%    rawread       - Read a Portable Bitmap file, or a raw file
%    rawwrite      - Write a Portable Bitmap file, or a raw file
% 
%  Image Display
%    imdisp        - Display an image
% 
%  Active Contour
%    snakeinit     - Initialize the snake manually
%    snakedeform   - Deform snake in the given external force field
%    snakedeform2  - Deform snake in the given external force field with
%                    pressure force
%    snakedisp     - Display a snake
%    snakeinterp   - Interpolate the snake adaptively
%    snakeinterp1  - Interpolate the snake at a fixed resolution
%                    (better implemented than snakeinterp)
% 
%  Gradient Vector Flow
%    GVF           - Compute the gradient vector flow field
% 
%  Other
%    dt            - Simple distance transform
%    gaussianBlur  - Blurring an image using gaussian kernel   
%    gaussianMask  - Generate a discrete gaussian mask

