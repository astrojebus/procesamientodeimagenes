[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,3,1)
imshow(a);
title('Imagen Original');

h=fspecial('laplacian',0.5);
a1=imfilter(a,h);
subplot(1,3,2)
imshow(a1);
title('Imagen filtro laplacian con 0.5');

h=fspecial('laplacian',1);
a2=imfilter(a,h);
subplot(1,3,3)
imshow(a2);
title('Imagen filtro laplacian con 1');
end