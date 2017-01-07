clear;
clc;
texture = imread('img/style_C.jpg');
texture = im2double(texture);
texture = imresize(texture,1/4);
patchsize = 10;
overlap = 3;
target = imread('img/content.jpg');
target = im2double(target);
target = imresize(target,1/2);
tol = 0.5;
% // sample
imout = texture_transfer(texture, target, patchsize, overlap, tol);
imout = imresize(imout,2);
% imout = imout / 255;
imshow(imout);