%Componentes RGB
%Determinacion del numero de objetos de una imagen
[Filename Path]=uigetfile('*.jpg','abrir imagen');
if isequal(Filename,0)
return;
else
    a=imread(strcat(Path,Filename));%a es tipo imagen uint8
    subplot(2,2,1);
    imshow(a);
    title('Imagen Original');
    [f c d]=size(a);
    b=zeros(f,c,d);
    c=im2double(a);
    b(:,:,1)=c(:,:,1);
    d=im2uint8(b);
    subplot(2,2,2);
    imshow(d);
    title('Componente Rojo');
    [f c d]=size(a);
    e=zeros(f,c,d);
    f=im2double(a);
    e(:,:,2)=f(:,:,2);
    g=im2uint8(e);
    subplot(2,2,3);
    imshow(g);
    title('Componente Verde');
    [f c d]=size(a);
    i=zeros(f,c,d);
    j=im2double(a);
    i(:,:,3)=j(:,:,3);
    k=im2uint8(i);
    subplot(2,2,4);
    imshow(k);
    title('Componente Azul');
    end