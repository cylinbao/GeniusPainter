clear;

img = imread('style/starry.jpg');
rImg = imresize(img,[1024 12080);
imwrite(rImg,'style/starry2.jpg');
img = imread('content/neckar.jpg');
rImg = imresize(img,[1024 12080);
imwrite(rImg,'content/neckar2.jpg');
img = imread('content/colosseo.jpg');
rImg = imresize(img,[1024 12080);
imwrite(rImg,'content/colosseo2.jpg');
