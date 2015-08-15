clear all;
clc;
load mri;%escalar volumen de datos;imágenes de resonancia magnética (MRI)
a=imread('c:\paisaje.jpg');
i=ind2gray(a,map);%convierte la imagen con mapa de colores en escala de grises
%elimina el matiz y la saturación de la información de la imagen de entrada, manteniendo la luminancia.
x= mat2gray(i);%onvierte la matriz "i" a la imagen de intensidad "x"
%%%%% correcion gamma
gamma= input('ingrese un valor entre 5 y una cantidad considerable para diferenciar la correcion gamma: ');

gx= x.^gamma;%formula de gamma para ser aplicada a la imagen "x".
subplot(1,3,1), Imshow(a); 
title('Imagen original');
subplot(1,3,2), Imshow(x,[]), 
title('Imagen con mapa de colores');
subplot(1,3,3), Imshow(gx,[]); 
title('Imagen con correcion gamma');