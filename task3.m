close all;
clear all;
clc;

p=imread('download.jpg');
imshow(p);
title('Original Image')
figure
p=rgb2gray(p);
imshow(p);
title('Gray Scale Image')
figure
histogram(p);
title('Histogram of the original Image')
figure

mi=min(min(p));
ma=max(max(p));

new=(p-mi)*(255/(ma-mi));

imshow(new);
title('Image after histogram stretching')
figure
histogram(new);
title('Histogram of Image after contrast Stretching')