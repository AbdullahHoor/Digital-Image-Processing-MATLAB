clear all;
close all;
clc;
img=rgb2gray(imread('Chelsea-2018-19-Home-Blue-Shirt-1-1024x1024.jpg'));      
subplot 221
imshow(img,[]);
title('original image');    
[m n]=size(img);            
img=imnoise(img,'salt & pepper');  
subplot 222
imshow(img,[]);
title('Noisy image');    
Nmax=3;        
imgn=zeros(m+2*Nmax,n+2*Nmax);      
imgn(Nmax+1:m+Nmax,Nmax+1:n+Nmax)=img;  
imgn(1:Nmax,Nmax+1:n+Nmax)=img(1:Nmax,1:n);                
imgn(1:m+Nmax,n+Nmax+1:n+2*Nmax)=imgn(1:m+Nmax,n+1:n+Nmax);    
imgn(m+Nmax+1:m+2*Nmax,Nmax+1:n+2*Nmax)=imgn(m+1:m+Nmax,Nmax+1:n+2*Nmax);  
imgn(1:m+2*Nmax,1:Nmax)=imgn(1:m+2*Nmax,Nmax+1:2*Nmax);      
re=imgn;      

for i=Nmax+1:m+Nmax
    for j=Nmax+1:n+Nmax
        r=1;              
        while r~=Nmax+1    
            W=imgn(i-r:i+r,j-r:j+r);
            W=sort(W(:));          
            Imin=min(W(:));        
            Imax=max(W(:));        
            Imed=W(ceil((2*r+1)^2/2));      
            if Imin<Imed && Imed<Imax      
               break;
            else
                r=r+1;              
            end          
        end
             
        if Imin<imgn(i,j) && imgn(i,j)<Imax        
            re(i,j)=imgn(i,j);
        else                                        
            re(i,j)=Imed;
        end
    end
end
subplot 223
imshow(re(Nmax+1:m+Nmax,Nmax+1:n+Nmax),[]);
title('Adpative mean filtetred image')
