clc;clear;close all;
img = rgb2gray(imread('onion.png'));
% img = (imread('rice.png'));

f = fft2(double(img));
s = fftshift(log(1+abs(f)));

radio_a = 2;
radio_b = 0;
wide = 105;
[R, C] = size(s);

mask = ones(size(s));
for r=1:R
    for c=1:C
        a = r - R/2;
        b = c - C/2;
        if a^2 + b^2 - radio_a^2 < 0
            if a^2 + b^2 - radio_b^2 > 0
                mask(r, c) = 0;
            end
        end

    end
end

s_result = fftshift(f) .* mask;
f_result = ifftshift(s_result);
result = uint8(real(ifft2(f_result)));

subplot(2, 2, 1);imshow(img);
subplot(2, 2, 2);imshow(s, []);
subplot(2, 2, 3);imshow(result);
subplot(2, 2, 4);imshow(log(1+abs(s_result)), []);

