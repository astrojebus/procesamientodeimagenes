clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
   b=rgb2gray(img);
   c=imadjust(b);
   subplot(2,2,1);
   imshow(c);
   subplot(2,2,2);
   imhist(b);
   subplot(2,2,3);
   imhist(c);
end