clear all;
clc;
a=imread('c:\paisaje.jpg');
c=a*1.5;
b=a-100;
subplot(1,3,1);
imshow(a);
title('Imagen original')
subplot(1,3,2);
imshow(c);
title('Imagen con Contraste(Aumento 50%)');
subplot(1,3,3);
imshow(b);
title('Imagen con Iluminacion(Menos 100 niveles)');
