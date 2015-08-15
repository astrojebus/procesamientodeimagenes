clear all;
clc;
a=imread('c:\paisaje.jpg');
title('Imagen Original');
subplot(2,3,1);
imshow(a);

title('Histograma R');
imhist(a(:,:,1));
subplot(2,3,2);
imshow(a);

title('Histograma G');
imhist(a(:,:,2));
subplot(2,3,3);
imshow(a);

title('Histograma B');
imhist(a(:,:,3));
subplot(2,3,4);
imshow(a);