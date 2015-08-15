clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    a=imread(strcat(ruta,archivo));
   mf=[1 2 3 4;5 6 7 8 ;9 10 11 12 ;13 14 15 16]/136;
b=imfilter(a,mf,'corr');
c=imfilter(a,mf,'conv');
subplot(1,3,1);
imshow(a);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);
end
