[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return;
else
    a=imread(strcat(path,filename));
    mf=fspecial('average',[11 11]);
    b=imfilter(a, mf);
    imshow(b);
    title('Filtro promedio');
end