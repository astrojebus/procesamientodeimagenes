
[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,5,1)
imshow(a);
title('Imagen Original');

h=fspecial('average',[3 3]);
a1=imfilter(a,h);
subplot(1,5,2)
imshow(a1);
title('Imagen filtro 5*5');

h=fspecial('average',[5 5]);
b=imfilter(a,h);
subplot(1,5,3)
imshow(b);
title('Imagen filtro 5*5');

h=fspecial('average',[7 7]);
b1=imfilter(a,h);
subplot(1,5,4)
imshow(b1);
title('Imagen filtro 7*7');

h=fspecial('average',[11 11]);
b3=imfilter(a,h);
subplot(1,5,5)
imshow(b3);
title('Imagen filtro 11*11');
end

