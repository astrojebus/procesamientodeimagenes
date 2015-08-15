clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
    b=rgb2gray(img);
   [cont,x]=imhist(b);
   acum=0;
   for i=1:256
       h(i)=acum+cont(i);
       acum=h(i);
   end
   stem(x,h);
end