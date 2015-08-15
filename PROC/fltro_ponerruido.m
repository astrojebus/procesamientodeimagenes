

clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
   b= imnoise(a,'salt & pepper', 0.1);
   imshow(b);
   imwrite(b,path);
   
   
   c=imnoise(a,'gaussian',0.04);
   imshow(c);
   d=imnoise(a,'poisson');
   imshow(d);

end