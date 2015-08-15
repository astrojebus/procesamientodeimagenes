[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,5,1)
imshow(a);
title('Imagen Original');

h=fspecial('gaussian',[7,7],2);
a1=imfilter(a,h);
subplot(1,5,2)
imshow(a1);
title('Imagen filtro gauss 7*7 con 2');

h=fspecial('gaussian',[7,7],4);
b=imfilter(a,h);
subplot(1,5,3)
imshow(b);
title('Imagen filtro gauss 7*7 con 4');

h=fspecial('gaussian',[5,5],6);
b1=imfilter(a,h);
subplot(1,5,4)
imshow(b1);
title('Imagen filtro gauss 5*5 con 6');

h=fspecial('gaussian',[5,5],2);
b3=imfilter(a,h);
subplot(1,5,5)
imshow(b3);
title('Imagen filtro gauss 5*5 con 2');
end