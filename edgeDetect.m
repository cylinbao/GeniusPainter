function [edge] = edgeDetect(img)
[x y z] = size(img);
% Shrink image size for capturing image texture
img = imresize(img,[480 720]);
gImg = rgb2gray(img);
% Apply DOG on image to get edge information
dImg = mydog(gImg);
% Binarize the dImg to get the edges
th = graythresh(dImg);
bImg = im2bw(dImg,th);
% Enlarge image back to original size
edge = imresize(bImg,[x y]);

% se = strel('disk',1);
% edge = imclose(edge,se);
% edge = imopen(edge,se);
% edge = imdilate(edge,se);

end
