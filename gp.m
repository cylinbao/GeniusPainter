clear;

cen = [17 57];
style = imread('images/style_C.jpg');
style = imresize(style,1/4);
styleText = edgeDetect(style);

imshow(styleText);

%[strokes colorStrokes] = getStrokes(style,styleText,cen);

% figure
% for i = 1:size(colorStrokes)
%    subplot(6,6,i)
%    imshow(colorStrokes(i).Image)
% end