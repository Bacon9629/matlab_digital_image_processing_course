clear;close all;clc;
pout = imread('pout.tif');pout = double(pout);
[w, h] = size(pout);
for j=1:w
    a = 1;b = h; r = (b-a).*rand(255, 1) + a;
    r = round(r);
    pout(j, r(:)) = NaN;

end

figure,subplot(121);imshow(uint8(pout));



N = w; n = 1; e = ones(N, 1);
D = spdiags([e, -2*e e], 0:2, N-2, N);
for i=1:h
    y = pout(:, i);
    k = isfinite(y); S = speye(N); S(~k, :) = [];
    Sc = speye(N); Sc(k, :) = [];
    L = sum(~k);
    v = -(Sc * (D' * D) * Sc') \ (Sc * D' * D * S' * y(k));
    x = zeros(N, 1); x(k) = y(k);
    x(~k) = v; pout(:, i) = x;
end
subplot(122);imshow(uint8(pout));
