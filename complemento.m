clc;
clear all;
[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
   
    pmax=max(max(img));
    c(:,:,1)=pmax(:,:,1)-img(:,:,1);
    c(:,:,2)=pmax(:,:,1)-img(:,:,2);
     c(:,:,3)=pmax(:,:,1)-img(:,:,3);
     
    imshow(c);
end