function [Icorr, iMax, jMax, c] = imcorr(I, w)
[m, n] = size(I); [m0, n0] = size(w);
Icorr = zeros(m-m0+1, n-n0+1);
vecW = double(w(:));
normW = norm(vecW);
for ii = 1:m-m0+1
    for jj = 1:n-n0+1
%         display(ii);
%         display(jj);
        subMat = I(ii:ii+m0-1, jj:jj+n0-1);
        vec = double(subMat(:));
        Icorr(ii, jj) = vec'*vecW/(norm(vec)*normW+eps);
    end
end

c = max(Icorr(:));
[iMax, jMax] = find(Icorr == c);
figure, imshow(I);
hold on;

for ii=1:length(iMax)
    plot([jMax(ii), jMax(ii)+n0-1], [iMax(ii), iMax(ii)]);
    plot([jMax(ii)+n0-1, jMax(ii)+n0-1], [iMax(ii), iMax(ii)+m0-1]);
    plot([jMax(ii), jMax(ii)+n0-1], [iMax(ii)+m0-1, iMax(ii)+m0-1]);
    plot([jMax(ii), jMax(ii)], [iMax(ii), iMax(ii)+m0-1]);
end

end