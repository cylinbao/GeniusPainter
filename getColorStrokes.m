function [strokes colorStrokes] = getColorStrokes(box,startPos,strokes)

numStrokes = size(strokes)

for i = 1:numStrokes
    bBox = int32(strokes(i).BoundingBox);
    window = box(bBox(2):bBox(2)+bBox(4)-1,bBox(1):bBox(1)+bBox(3)-1,:);
    r = window(:,:,1) .* uint8(strokes(i).Image);
    g = window(:,:,2) .* uint8(strokes(i).Image);
    b = window(:,:,3) .* uint8(strokes(i).Image);
    colorBox = cat(3,r,g); colorBox = cat(3,colorBox,b);
    colorStrokes(i).Image = colorBox;
    bBox = bBox + int32([startPos(2) startPos(1) 0 0]);
    strokes(i).BoundingBox = bBox;
    colorStrokes(i).BoundingBox = bBox;
    colorStrokes(i).Area = strokes(i).Area;
end

end