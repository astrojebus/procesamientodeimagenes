[Archivo Ruta]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Archivo,0)
    return;
else
    a=imread(strcat(Ruta,Archivo));
    subplot(1,2,1);
    imshow(a)
    title('Imagen Original');
    b=imcrop(a);%Recortar la imagen a.
    subplot(1,2,2);
    imshow(b);
    title('Imagen recortada'); 
end