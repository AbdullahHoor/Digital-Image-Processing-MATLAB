clear all;
close all;
clc;
img=imread('Chelsea-2018-19-Home-Blue-Shirt-1-1024x1024.jpg');
imshow(img);
title('Orignal image')
figure
gray_img=im2double(rgb2gray(img));
imshow(gray_img);
title('Gray image')
figure

noisy_img=imnoise(gray_img,'gaussian');
imshow(noisy_img);
title('Noisy Image');
figure

paddedimage2=padarray(gray_img,[1,1]);
[r,c]=size(paddedimage2);
 
for i=2:r-1
    for j=2:c-1
        out=[paddedimage2(i-1,j-1),paddedimage2(i-1,j),paddedimage2(i-1,j+1),paddedimage2(i,j-1),paddedimage2(i,j),paddedimage2(i,j+1),paddedimage2(i-1,j),paddedimage2(i+1,j-1),paddedimage2(i+1,j),paddedimage2(i+1,j+1)];
       a=max(out);
       b=min(out);
        outimage(i,j)=(a+b)/2;
    end
end
u=outimage;
imshow(u);
title('Filtered Image');