clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    a=imread(strcat(ruta,archivo));
   mf=zeros(51,51); %se cambia lso valor apara cambiar el borde
   mf(26,26)=1;  %la mitas de l de arriba
   b=imfilter(a,mf,25,'replicate','full');
   imshow(b);
end
