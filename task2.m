close all;
clear all;
clc;

p=imread('Chris-Gampat-La-Noir-Image-High-Contrast-black-and-white-6.jpg');
imshow(p);
title('Orignal Image')
figure
p=rgb2gray(p);
imshow(p);
title('Gray Scale Image')
figure
h=zeros(1,256);

for i=1:1333
    for j=1:2000
        z=p(i,j);
        h(z+1)=h(z+1)+1;
    end
end
imshow(z);
figure
stem(h);
title('Histogram We computed')
figure
histogram(p);
title('Histogram using MATLAB built-in command')