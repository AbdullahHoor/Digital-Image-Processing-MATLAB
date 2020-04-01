close all;
clear all;
clc;

im=imread('bright-spring-view-cameo-island-600w-1048185397.jpg');
imshow(im);
title('Orignal Image')
figure
imgr=rgb2gray(im);
imshow(imgr);
title('Gray Image')
figure
imd=im2double(imgr);
noi=imnoise(imd,'salt & pepper');
imshow(noi);
title('Noisy Image')
figure
[r,c]=size(noi);
padded=zeros(r+2,c+2);
padded(2:349,2:601)=noi;
imshow(padded);
title('Padded Image')
figure
for i=2:r
    for j=2:c
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1),padded(i,j-1),padded(i,j),padded(i,j+1),padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        o=sort(out);
        outimg(i,j)=o(1,5);
    end
end

imshow(outimg);
title('Median filter Image')
figure

mask=[1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        out(i-1,j-1)=mask(1,1)*padded(i-1,j-1)+mask(1,2)*padded(i-1,j)+mask(1,3)*padded(i-1,j+1)+mask(2,1)*padded(i,j-1)+mask(2,2)*padded(i,j)+mask(2,3)*padded(i,j+1)+mask(3,1)*padded(i+1,j-1)+mask(3,2)*padded(i+1,j)+mask(3,3)*padded(i+1,j+1);
    end
end


imshow(out/9);
title('Averaging filter Image')