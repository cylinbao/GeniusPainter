clear;

sigma = 0.1;
img = imread('style/starry.jpg');
img = imresize(img,[480 720]);
gImg = rgb2gray(img);

% for i = 1:3
i = 1;
	dImg = mydog(gImg,sigma*i);
	th = graythresh(dImg);
	dImg = im2bw(dImg,th);
	dImg = imresize(dImg,[1024 1280]);
	% subplot(3,3,i)
	figure
	imshow(dImg);
% end
