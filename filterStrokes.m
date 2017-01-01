function [fStrokes] = filterStrokes(strokes,thres)

numStrokes = size(strokes);
flag = logical(false);

for i = 1:numStrokes
    if strokes(i).Area > thres && flag == 0
        fStrokes(1) = strokes(i);
        flag = logical(true);
    elseif strokes(i).Area > thres
        fStrokes(end+1) = strokes(i);
    end
end
fStrokes = fStrokes';
end