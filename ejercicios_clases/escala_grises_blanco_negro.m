[Filename Path]=uigetfile('*.jpg;*bmp;*.png''Abrir Imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(Path,Filename));
    subplot(2,2,1);
    imshow(a);
    title('Imagen Original');
    b=rgb2gray(a);
    subplot(2,2,2);
    imshow(b);
    title('Imagen a escala de grises');
    umbral=graythresh(b);
    c=im2bw(b,umbral);
    subplot(2,2,3);
    imshow(c);
    title('Imagen a blanco y negro');
end
