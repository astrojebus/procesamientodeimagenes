clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
    b=rgb2gray(img);
    c=im2bw(b,0.8);
  
    imhist(c);
    
    
    subplot(2,2,1);
    imhist(img(:,:,1));
    subplot(2,2,2);
    imhist(img(:,:,2));
    subplot(2,2,3);
    imhist(img(:,:,3));
end