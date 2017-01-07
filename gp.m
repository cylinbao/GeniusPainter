clear;

style = imread('images/style_C.jpg');
style = imresize(style,1/4);
styleText = edgeDetect(style);
% figure
% imshow(styleText);

seg = logical(zeros(size(style(:,:,1))));
seg(1:50,1:50) = 1;
lab = rgb2lab(style);
color(1).LAB = lab(1,1,:);
color(2).LAB = lab(50,50,:);

[strokes colorStrokes] = getStrokes(style,styleText,seg,color);

figure
for i = 1:size(colorStrokes)
   subplot(6,6,i)
   imshow(lab2rgb(colorStrokes(i).Image))
end