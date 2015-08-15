[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(path,Filename));
    subplot(1,5,1);
    imshow(a);
    title('Imagen Orginal');
    
    j=imnoise(a,'salt & pepper',0.05);
    subplot(1,5,2);
    imshow(j);
    title('Imagen Ruido sal y pimienta');
    
    j2=imnoise(a,'gaussian',0,5);
    subplot(1,5,3);
    imshow(j2);
    title('Imagen gaussiana');
    
    j3=imnoise(a,'poisson');
    subplot(1,5,4);
    imshow(j3);
    title('Imagen poisson');
        
    j4=imnoise(a,'speckle',0.5);
    subplot(1,5,5);
    imshow(j4);
    title('Imagen speckle');
end