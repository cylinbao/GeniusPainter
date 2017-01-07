function [strokes colorStrokes] = getStrokes(img,edge,seg,color)

% if size(seg) == size(edge)
%     boxEdge = edge & seg;
% else
%     error('Error: Size inconsistent');
% end
boxEdge = edge & seg;
figure
imshow(boxEdge);

CC = bwconncomp(boxEdge);

% numPixels = cellfun(@numel,CC.PixelIdxList);
% [biggest,idx] = max(numPixels)

strokes = regionprops(CC,'BoundingBox','Image');
% strokes = filterStrokes(strokes,10);
[strokes colorStrokes] = getColorStrokes(strokes,color);

end

