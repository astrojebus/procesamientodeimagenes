[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
subplot(1,2,1)
imshow(a);
title('Imagen Original');

h=fspecial('prewitt');
a1=imfilter(a,h);
subplot(1,2,2)
imshow(a1);
title('Imagen filtro prewitt');
end
