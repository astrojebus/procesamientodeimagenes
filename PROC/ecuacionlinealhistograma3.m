
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
    
r=a(:,:,1); 
g=a(:,:,2);
c(:,:,1)=histeq(r,200);
c(:,:,2)=histeq(g,200); 
c(:,:,3)=histeq(b,200);
subplot(1,2,1); 
imshow(a);
title('magen Original'); 
subplot(1,2,2);
imshow(c);
title('lmagen Mejorada'); 


end