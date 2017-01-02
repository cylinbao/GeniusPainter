function [strokes colorStrokes] = getStrokes(img,edge,cen,boxRange)
switch nargin
	case 3
		boxRange = [50 50];
end

[row col dep] = size(img);

startRow = cen(1)-boxRange(1); startCol = cen(2)-boxRange(2);
endRow = cen(1)+boxRange(1)-1; endCol = cen(2)+boxRange(2)-1;

if startRow < 1
    startRow = 1;
end
if endRow > row
    endRow = row; 
end
if startCol < 1
    startCol = 1;
end
if endCol > col
    endCol = col; 
end

startPos = [startRow startCol];
box = img(startRow:endRow,startCol:endCol,:);
boxEdge = edge(startRow:endRow,startCol:endCol,:);

CC = bwconncomp(boxEdge);

% numPixels = cellfun(@numel,CC.PixelIdxList);
% [biggest,idx] = max(numPixels)

strokes = regionprops(CC,'Area','BoundingBox','Image');
strokes = filterStrokes(strokes,10);
[strokes colorStrokes] = getColorStrokes(box,startPos,strokes);

end

