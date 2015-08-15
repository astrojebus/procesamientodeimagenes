[Filename Path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(Path,Filename));
%rotar img
ang=input('Íngrese el angulo de rotacion: ');
b=imrotate(a,ang);%rotar
subplot(2,2,1);
imshow(a)
title('Imagen Original');
subplot(2,2,2);
imshow(b)
title('Rotacion');
auxa=im2double(a);
d(:,:,1)=flipud(auxa(:,:,1));%fliplr=invierte en x
d(:,:,2)=flipud(auxa(:,:,2));
d(:,:,3)=flipud(auxa(:,:,3));
d=im2uint8(d);
subplot(2,2,3);
imshow(d);
title('Imagen Inversa');
end

%escalamiento(Aumentar y disminuir tamano)
fil=input('ingrese el numero de filas: ');
col=input('ingrese el numero de columnas: ');
e=imresize(a,[fil,col]);
subplot(3,2,5);
imshow(e)
title('Escalamiento');
axis on;

%traslacion
[m n o]=size(a);
f=zeros(m, n, o);
mf=30;%mover filas
for fi=1:m
mc=40;%mover columnas
for ci=1:n
f(mf,mc,:)=auxa(fi,ci,:);
mc=mc+1;
end
mf=mf+1;
end
f=im2uint8(f);
subplot(3,2,6);
imshow(f);
title('traslacion');



