clc;
clear all;
[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
   gris=rgb2gray(img);
    pmax=max(max(gris));
 c=pmax-gris;
    imshow(c);
end