close all;
clear all;
clc;

im=imread('bright-spring-view-cameo-island-600w-1048185397.jpg');
imshow(im);
title('Orignal image')
figure

imd=im2double(im);

noi=imnoise(imd,'salt & pepper');
imshow(noi);
title('Noisy Image')
figure
s=struct;
for i=1:5
    s(i).noiseimage=imnoise(imd,'salt & pepper');
end

sum=0;
for i=1:5
    sum=sum+s(i).noiseimage;
end
avg=sum/5;
imshow(avg);
title('5 avg image')
figure

s=struct;
for i=1:25
    s(i).noiseimage=imnoise(imd,'salt & pepper');
end

sum=0;
for i=1:25
    sum=sum+s(i).noiseimage;
end
avg=sum/25;
imshow(avg);
title('25 avg image')
figure

s=struct;
for i=1:50
    s(i).noiseimage=imnoise(imd,'salt & pepper');
end

sum=0;
for i=1:50
    sum=sum+s(i).noiseimage;
end
avg=sum/50;
imshow(avg);
title('50 avg image')