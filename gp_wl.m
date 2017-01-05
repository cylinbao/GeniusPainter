clear;

sty = imread('images/style_C.jpg');
cont = imread('images/content2.jpg');

sty = imresize(sty,1/4);
% sty = rgb2gray(sty);

cont_hm = imhistmatch(cont,sty);
% figure
% imshow(cont_hm);

styG = imgaussfilt(sty,1);
% figure
% imshow(styG);
% contG = imgaussfilt(cont_hm,1);
contG = cont_hm;

[sA sH sV sD] = dwt2(im2double(styG),'haar');
[cA cH cV cD] = dwt2(im2double(contG),'haar');

tran = idwt2(0.75*cA + 0.25*sA,cH + 1.5*sH,cV + 1.5*sV,cD + 1.5*sD,'haar');
% tranG = imgaussfilt(tran,0.5);
figure
imshow(tran);

% tran2 = idwt2(cA,cH,cV,0.5*sA,'haar');
% tranG2 = imgaussfilt(tran2,0.25);
% figure
% imshow(tranG2);