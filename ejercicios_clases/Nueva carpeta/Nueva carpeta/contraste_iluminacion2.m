clear all;
clc;
a=imread('c:\paisaje.jpg');
b=double(a);
[m n o]=size(b);%para calcular las dimensiones de la matriz el size fila 
%columna y dimension
for i=1:m
for j=1:n
for k=1:3
c(i,j,k)=b(i,j,k)*1.5;
if c(i,j,k)>255
c(i,j,k)=255;
end
d(i,j,k)=b(i,j,k)-100;
if d(i,j,k)>255
d(i,j,k)=255;
end
if d(i,j,k)<0
d(i,j,k)=0;
end
end
end
end
c=uint8(c);
d=uint8(d);
subplot(1,3,1);
imshow(a);
title('Imagen Original');
subplot(1,3,2);
imshow(c);
title('Imagen con Contraste(Aumento 50%)');
subplot(1,3,3);
imshow(d);
title('Imagen con Iluminacion(Menos 100 niveles)');