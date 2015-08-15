clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    a=imread(strcat(ruta,archivo));
   mf=[0 0 -1 0 0;0 -1 -2 -1 0;-1 -2 16 -2 -1;0 -1 -2 -1 0;0 0 -1 0 0];
b=imfilter(a,mf);
subplot(1,2,1);
imshow(a);
subplot(1,2,1);
imshow(a);
subplot(1,2,2);
imshow(b);
end
