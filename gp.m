clear;

cen = [480 720];
style = imread('images/starry.jpg');
styleText = edgeDetect(style);
[strokes colorStrokes box boxEdge] = getStrokes(style,styleText,cen);