[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,3,1)
imshow(a);
title('Imagen Original');

h=fspecial('motion',100,45);
a1=imfilter(a,h);
subplot(1,3,2)
imshow(a1);
title('Imagen filtro motion 100 con 45 grados');

h=fspecial('motion',200,45);
b=imfilter(a,h);
subplot(1,3,3)
imshow(b);
title('Imagen filtro motion 200 con 45 grados');
end