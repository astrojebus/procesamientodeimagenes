    [Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
    a=imread(strcat(Path, Filename));
% [m n o]=size(a);
% b=double(a);
% r=b;
% for i=2:m-1
%    for j=2:n-1
%        for k=1:3
%          r(i,j,k)=1/9*(b(i-1,j-1,k)+b(i-1,j,k)+b(i-1,j+1,k)+b(i,j-1,k)+b(i,j,k)+b(i,j+1,k)+b(i+1,j-1,k)+b(i+1,j,k)+b(i+1,j+1,k)); 
%        end
%    end
% end
% r=uint8(r);
% subplot(1,2,1)
% imshow(a);
% title('Imagen Original');
% subplot(1,2,2)
% imshow(r);
% title('Imagen con Suavizado');
%-------------------------OTRA FORMA CON COMANDO----------
%  c=ones(3,3)/9;
%  d=imfilter(a,c);
%  subplot(2,3,1);
%  imshow(a);
%  title('Imagen Original');
%  subplot(2,3,2);
%  imshow(d);
%  title('Imagen con filtro box');
% %-----------------------------5x5---------------------------
% c5=ones(5,5)/25;
% d5=imfilter(a,c5);
% subplot(2,3,3);
% imshow(d5);
% title('Imagen con filtro box');
% %-----------------------7X7-----------------------------------
% c7=ones(7,7)/49;
% d7=imfilter(a,c7);
% subplot(2,3,4);
% imshow(d7);
% title('Imagen con filtro box');
% %----------------------------11X11--------------------------------
% c11=ones(11,11)/121;
% d11=imfilter(a,c11);
% subplot(2,3,5);
% imshow(d11);
% title('Imagen con filtro box');
%--------------------COVULUCION LINEAL Y CORRELACION
%c=ones(3,3)/9;%Ones es cuando uno quiere sacar la matriz filtro promedio
 m= [0.1 0.5 0.2;0.4 0.5 0.6;0.7 0.8 0.9];
d=imfilter(a,m,'corr');
subplot(1,2,1);
imshow(a);
title('Imagen Original');
subplot(1,2,2);
imshow(d);
title('Imagen con filtro box');