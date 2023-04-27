clear;close all;clc;

pout = imread('pout.tif');
figure;subplot(131);imshow(pout);

for i=1:291
    Npout(i, 1:230) = pout(i, 1:230);
end

subplot(132);imshow(Npout);


for ii = 1:291
    y = double(Npout(ii, 1:230))';
    N = length(y);
    H = toeplitz(y(6:N-1), y(6:-1:1));  % create H as a Toeplitz Matrix (equivalent to above)
    b = y(7:N);
    a = (H' * H) \ (H' * b);
    L = 15;
    g = [y; zeros(L, 1)];
    for i = N + 1: N + L
        g(i) = a(1) * g(i-1) + a(2) * g(i-2) + a(3) * g(i-3) + a(4) * g(i-4) + a(5) * g(i-5) + a(6) * g(i-6);
          
    end
    NNpout(ii, :) = g';
end
subplot(133);imshow(uint8(NNpout));
