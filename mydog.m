function dogImg = mydog(grayImg)

k = 10;
sigma1 =  0.5;
sigma2 = sigma1*k;

hsize = [3,3];

h1 = fspecial('gaussian', hsize, sigma1);
h2 = fspecial('gaussian', hsize, sigma2);

gauss1 = imfilter(grayImg,h1,'replicate');
gauss2 = imfilter(grayImg,h2,'replicate');

dogImg = im2double(gauss1 - gauss2);
figure;
subplot(121)
imshow(grayImg);
subplot(122)
imshow(dogImg);

end
