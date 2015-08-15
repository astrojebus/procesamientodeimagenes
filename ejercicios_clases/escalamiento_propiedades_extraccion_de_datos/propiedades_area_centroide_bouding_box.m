 a=imread('c:\figuras.jpg');
 figure;
 imshow(a);
 eg=rgb2gray(a);
% figure;
% imshow(eg);
 umbral=graythresh(eg);
 bn=im2bw(eg,umbral);
% figure;
% imshow(bn);
 [L  num]=bwlabel(bn);
 %etiqueta=L numero de Objetos=num
 %msgbox(sprintf('Numero de objetos:%d',num),'Mensaje');
 c=input('Ingrese un numero');
 while(c>=1 && c<=num)
  
 propiedades=regionprops(c);
  a=propiedades(c).Area;
  msgbox(sprintf('Area primer objeto:%0.2f',a),'Area');
  b=propiedades(c).Centroid;
  msgbox(sprintf('Centro de gravedad del objeto:%0.2f',a),'Centro de Gravedad');
  c=propiedades(c).BoundingBox;
  msgbox(sprintf('Bounding Box del objeto:%0.2f',a),'Bounding Box');
 end

