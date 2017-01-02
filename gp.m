clear;

cen = [480 720];
style = imread('images/style_C.jpg');
styleText = edgeDetect(style);

[strokes colorStrokes] = getStrokes(style,styleText,cen);
