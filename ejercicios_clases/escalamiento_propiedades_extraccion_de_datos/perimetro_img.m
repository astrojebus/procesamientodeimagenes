%Reconocer Objetos de una imagen
a=imread('C:\Users\Estudiantes\Pictures\monedas.png');
figure;%imprime varias imagenes por cada ventana en separado
imshow(a);
eg=rgb2gray(a);
%figure;
%imshow(eg);
umbral=graythresh(eg);
bn=im2bw(eg,umbral);
bn=imfill(bn,'holes');%Comando para eliminar lo que esta dentro de una figura
%figure;
%imshow(bn);
[L num]=bwlabel(bn);%L es una matriz donde el elemento 1 sera una figura y haci sucesivamente, 
%el bwlabel(); permite hayar los objetos o figura.
msgbox(sprintf('Número de Objetos: %d', num),'Mensaje');%el sprintf se usa para mostrar un mensaje.
%Sacar las propiedades{area, centro  de gravedad y building box}
%propiedades=regionprops(L);
%a=propiedades(1).Area;
%msgbox(sprintf('Area primer objeto: %0.2f',a),'Area');

%     b=input('Ingrese un numero: ');
%  a=propiedades(b).Area;
%  msgbox(sprintf('Area primer objeto: %0.2f',a),'Area');
%  
%  a=propiedades(b).Centroid;
%  msgbox(sprintf('Centro primer objeto: %0.2f',b),'Centro');
%   b=input('Ingrese un numero: ');
%  a=propiedades(b).BoundingBox;
%  msgbox(sprintf('BoundingBox del objeto: X1=> %0.2f X2=> %0.2f, Y1=> %0.2f, Y2=> %0.2f',a(1),a(2),a(3),a(4)),'BoundingBox');
 
%  %-------------------------------------PINTAR BORDES OBJETOS-----------------------------
%  hold on;
%  for i=1:num
%      rectangle('Position', propiedades(i).BoundingBox,'EdgeColor','b','LineWidth',4);
%      x=propiedades(i).Centroid(1);%1 son las x
%      y=propiedades(i).Centroid(2);%2 es la y
%      plot(x,y,'*');
%   end
 %--------------------------Vizualizar las figuras cuya area sea mayor a 600------------------------------------------------
%  x=find([propiedades.Area]>300);%find: comando para buscar
%  for i=1:size(x,2)
%      hold on;
%      rectangle('Position', propiedades(x(i)).BoundingBox,'EdgeColor','b','LineWidth',4);
%  end
%  x=find([propiedades.Area]<500 );%find: comando para buscar
%  for i=1:size(x,2)
%      hold on;
%      rectangle('Position', propiedades(x(i)).Area,'EdgeColor','b','LineWidth',4);  
%      x=propiedades(i).Area(1);%1 son las x
%      y=propiedades(i).Centroid(2);%2 es la y
%      plot(x,y,'&');
%  end
%  
%-------------------------------------COMO SACAR PERIMETRO---------------------------- 
 propiedades=regionprops(L,'area','perimeter');
 hold on;
 for i=1:num
     fprintf('perimetro del objetos %d: ',i);
     disp(propiedades(i).Perimeter);%disp :Sirve para imprimir
 end
