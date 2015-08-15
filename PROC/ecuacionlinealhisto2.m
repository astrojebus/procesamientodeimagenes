
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
    

b=rgb2gray(a);
c=histeq(b,255); 
subplot(1,2,1); imshow(b); 
title('imagen Original'); 
subplot(1,2,2); 
imshow(c); 
title('Imagen Mejorada'); 
end