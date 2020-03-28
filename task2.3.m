close all;
clear all;
clc;

im=imread('bright-spring-view-cameo-island-600w-1048185397.jpg');
subplot(3,4,1)
imshow(im);
title('Orignal Image')
imgr=rgb2gray(im);
imd=im2double(imgr);
noi=imnoise(imd,'gaussian');
subplot(3,4,2)
imshow(noi);
title('Noisy Image')
[r,c]=size(noi);
padded=zeros(r+2,c+2);
padded(2:349,2:601)=noi;
subplot(3,4,3)
imshow(padded);
title('Padded Image 3x3 mask')
mask=[1 2 1; 2 4 2; 1 2 1];
for i=2:r
    for j=2:c
        out(i-1,j-1)=mask(1,1)*padded(i-1,j-1)+mask(1,2)*padded(i-1,j)+mask(1,3)*padded(i-1,j+1)+mask(2,1)*padded(i,j-1)+mask(2,2)*padded(i,j)+mask(2,3)*padded(i,j+1)+mask(3,1)*padded(i+1,j-1)+mask(3,2)*padded(i+1,j)+mask(3,3)*padded(i+1,j+1);
    end
end
out=out/16;
subplot(3,4,4)
imshow(out);
title('Image 3x3 mask')

padded=zeros(r+4,c+4);
padded(3:350,3:602)=noi;
subplot(3,4,5)
imshow(padded);
title('Padded Image 5x5 mask')

h=fspecial('average',5);
out=imfilter(padded,h);
subplot(3,4,6)
imshow(out);
title('Image 5x5 mask')

padded=zeros(r+8,c+8);
padded(5:r+4,5:c+4)=noi;
subplot(3,4,7)
imshow(padded);
title('Padded Image 9x9 mask')

h=fspecial('average',9);
out=imfilter(padded,h);
subplot(3,4,8)
imshow(out);
title('Image 9x9 mask')

padded=zeros(r+14,c+14);
padded(7:r+6,7:c+6)=noi;
subplot(3,4,9)
imshow(padded);
title('Padded Image 15x15 mask')

h=fspecial('average',15);
out=imfilter(padded,h);
subplot(3,4,10)
imshow(out);
title('Image 15x15 mask')

padded=zeros(r+35,c+35);
padded(17:r+16,17:c+16)=noi;
subplot(3,4,11)
imshow(padded);
title('Padded Image 35x35 mask')

h=fspecial('average',35);
out=imfilter(padded,h);
subplot(3,4,12)
imshow(out);
title('Image 35x35 mask')