[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,3,1)
imshow(a);
title('Imagen Original');

h=fspecial('log',[5,5],0.5);
a1=imfilter(a,h);
subplot(1,3,2)
imshow(a1);
title('Imagen filtro laplacian logaritmica 5*5 con 0.5');

h=fspecial('log',[7,7],1);
b=imfilter(a,h);
subplot(1,3,3)
imshow(b);
title('Imagen filtro laplacian logaritmica 7*7 con 1');
end