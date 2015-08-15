
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
    gris=rgb2gray(a); %convertir a escala de grisis
    h=fspecial('prewitt'); %deteca los border
    b1=imfilter(gris,h); %aplciar filtro bordes horizontakles
    b2=imfilter(gris,h); %bore veritcales
    c=b1+b2; %une bordes
    imshow(c); %imprimir imagen con relieve
    title('imagen con relieve');
    d=max(max(c))-c;
    figure;
    imshow(d);
    title('dibjue a lapiz ');

end