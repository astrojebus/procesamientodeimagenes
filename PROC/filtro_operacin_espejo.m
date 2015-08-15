clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    a=imread(strcat(ruta,archivo));
   mf=zeros(2000,2000); %se cambia lso valor apara cambiar el borde
   mf(100,100)=1;  %la mitas de l de arriba
   b=imfilter(a,mf,'symmetric','full');
   imshow(b);
end
