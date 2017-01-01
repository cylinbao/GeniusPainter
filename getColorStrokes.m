function [colorStrokes] = getColorStrokes(box,startPos,strokes)

numStrokes = size(strokes);

for i = 1:numStrokes
    bBox = int32(strokes(i).BoundingBox);
    colorStrokes(i).BoundingBox =  bBox + int32([startPos(2) startPos(1) 0 0]);
    window = box(bBox(2):bBox(2)+bBox(4)-1,bBox(1):bBox(1)+bBox(3)-1,:);
    r = window(:,:,1) .* uint8(strokes(i).Image);
    g = window(:,:,2) .* uint8(strokes(i).Image);
    b = window(:,:,3) .* uint8(strokes(i).Image);
    colorBox = cat(3,r,g); colorBox = cat(3,colorBox,b);
    colorStrokes(i).Image = colorBox;
end

end