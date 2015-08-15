[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(path,Filename));
    a1=im2bw(a);
    i=edge(a1);
    subplot(1,2,1);
    imshow(a);
   title('Imagen Orginal');
    subplot(1,2,2);
    imshow(i);
    title('Bordes');
end