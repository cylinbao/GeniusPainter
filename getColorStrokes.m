function [strokes colorStrokes] = getColorStrokes(strokes,color)

numStrokes = size(strokes);

for i = 1:numStrokes
    colorIdx = randi(size(color));
    st = strokes(i);
    l = color(colorIdx).LAB(1) * double(st.Image);
    a = color(colorIdx).LAB(2) * double(st.Image);
    b = color(colorIdx).LAB(3) * double(st.Image);
    colorBox = cat(3,l,a); colorBox = cat(3,colorBox,b);
    colorStrokes(i).Image = colorBox;
    
    window = int32(st.BoundingBox);
    bBox = [window(2) window(1) window(4) window(3)];
    strokes(i).BoundingBox = bBox;
    colorStrokes(i).BoundingBox = bBox;;
end
colorStrokes = colorStrokes';
end