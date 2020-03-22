close all;
clear all;
clc;

p=imread('grayscale.jpg');
p=rgb2gray(p);
imshow(p);
figure
b8=bitget(p,8);
b7=bitget(p,7);
b6=bitget(p,6);
b5=bitget(p,5);
b4=bitget(p,4);
b3=bitget(p,3);
b2=bitget(p,2);
b1=bitget(p,1);
imshow(double(b5));
figure
imshow(double(b6));
figure
imshow(double(b7));
figure
imshow(double(b8));
figure

totalb=zeros(360,500);
totalb=bitset(totalb,8,b8);
totalb=bitset(totalb,7,b7);
totalb=bitset(totalb,6,b6);
totalb=bitset(totalb,5,b5);
imshow(uint8(totalb));

sub=double(p)-double(totalb);
imshow(double(sub));