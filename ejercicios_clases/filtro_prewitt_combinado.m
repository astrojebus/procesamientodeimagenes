[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path, Filename));
a1=rgb2gray(a);
subplot(1,6,1)
imshow(a);
title('Imagen Original');
mf=fspecial('prewitt');
%mf=fspecial('sobel');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
g=f+f1;
c=max(max(g))-g;
subplot(1,6,2)
imshow(a1);
title('Imagen a escala de grises');
subplot(1,6,3)
imshow(f);
title('Imagen filtro prewitt horizontal');
subplot(1,6,4)
imshow(f1);
title('Imagen filtro prewitt vertical');
subplot(1,6,5)
imshow(g);
title('Imagen filtro prewitt combinada');
subplot(1,6,6)
imshow(c);
title('Imagen filtro prewitt a carbon');
end
