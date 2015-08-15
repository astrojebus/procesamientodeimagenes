clc;
clear all;
[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    img=imread(strcat(ruta,archivo));
    
%extraer componente rojo
% [m n dim]=size(img); %extraer dimsnesion de inmagen
% b=zeros(m, n, dim); %definir matriz de ceros
% b(:,:,1)=img(:,:,1); %asignar componente rojo de img a b
% b=uint8(b);
% subplot(3,3,1);
% imshow(b);
% 
% 
% r=zeros(m, n, dim);
% r(:,:,2)=img(:,:,2); %asignar componente rojo de img a b
% r=uint8(r);
% subplot(3,3,2);
% imshow(r);
% 
% p(:,:,3)=img(:,:,3); %asignar componente rojo de img a b
% p=uint8(p);
% subplot(3,3,3);
% imshow(p);
% 
% con=img*1.5;
% subplot(3,3,4);
% imshow(con);
% 
% brillo=img-100;
% subplot(3,3,5);
% imshow(brillo);


b=im2double(img);
[m n k]=size(b);
for i=1:m
    for j=1:n
        for k=1:3
            c(i,j,k)=b(i,j,k)*1.5;
            if c(i,j,k)>1
                c(i,j,k)=1;
            end
            d(i,j,k)=b(i,j,k)-100/255;
            if d(i,j,k)>1
                d(i,j,k)=1;
            end
            if d(i,j,k)>1
                d(i,j,k)=1;
            end
            if d(i,j,k)<0
                d(i,j,k)=0;
            end
        end
    end
end

c=im2uint8(c);
d=im2uint8(d);
subplot(3,3,6);
imshow(c);
subplot(3,3,7);
imshow(d);

            



end