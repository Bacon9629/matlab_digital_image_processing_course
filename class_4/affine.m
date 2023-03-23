clc;clear;close all;
cb = checkerboard;
figure, imshow(cb)
xform = [1 0 0; 0 1 0; 40 40 1];
tform_translate = maketform('affine', xform);

cb_tran2 = imtransform( cb, tform_translate, 'XData', [1 (size(cb, 2)+xform(3, 1))], "YData", [1 (size(cb, 2)+xform(3, 2))]);

figure, imshow(cb_tran2)