[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,5,1)
imshow(a);
title('Imagen Original');

h=fspecial('disk',20);
a1=imfilter(a,h);
subplot(1,5,2)
imshow(a1);
title('Imagen filtro 5*5');

h=fspecial('disk',30);
b=imfilter(a,h);
subplot(1,5,3)
imshow(b);
title('Imagen filtro 5*5');

h=fspecial('disk',40);
b1=imfilter(a,h);
subplot(1,5,4)
imshow(b1);
title('Imagen filtro 7*7');

h=fspecial('disk',50);
b3=imfilter(a,h);
subplot(1,5,5)
imshow(b3);
title('Imagen filtro 11*11');
end

