function [strokes colorStrokes box boxEdge] = getStrokes(img,edge,cen,boxRange)
switch nargin
	case 3
		boxRange = [50 50];
end

startX = cen(1)-boxRange(1); startY = cen(2)-boxRange(2);
startPos(1) = startX; startPos(2) = startY;
box = img(startX:startX+boxRange(1)*2-1,startY:startY+boxRange(2)*2-1,:);
boxEdge = edge(startX:startX+boxRange(1)*2-1,startY:startY+boxRange(2)*2-1);

CC = bwconncomp(boxEdge);

% numPixels = cellfun(@numel,CC.PixelIdxList);
% [biggest,idx] = max(numPixels)

strokes = regionprops(CC,'Area','BoundingBox','Image');
strokes = filterStrokes(strokes,10);
colorStrokes = getColorStrokes(box,startPos,strokes);

end

