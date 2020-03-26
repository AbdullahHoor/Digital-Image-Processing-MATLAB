close all;
clear all;
clc

p=imread('download.jpg');
pixels=size(p,1)*size(p,2);
imshow(p);
title('Original Image');
figure

Hp=uint8(zeros(size(p,1),size(p,2)));
f=zeros(256,1);
pf=zeros(256,1);
pc=zeros(256,1);
c=zeros(256,1);
out=zeros(256,1);
n=1:256;

for i=1:size(p,1)
    for j=1:size(p,2)
        v=p(i,j);
        f(v+1)=f(v+1)+1;
        pf(v+1)=f(v+1)/pixels;
    end
end
stem(n,pf)
title('Probability Distribution Function')
figure
sum=0;

for i=1:size(pf)
       sum=sum+f(i);
       c(i)=sum;
       pc(i)=c(i)/pixels;
       out(i)=round(pc(i)*255);
end
plot(n,out)
title('Cumulative Distribution Function')
figure
for i=1:size(p,1)
    for j=1:size(p,2)
            Hp(i,j)=out(p(i,j)+1);
    end
end
imshow(Hp);
title('Histogram equalization');
figure
