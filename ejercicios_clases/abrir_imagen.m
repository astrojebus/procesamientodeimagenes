

[FileName Path]=uigetfile('*.jpg;*.bmp','Abrir Imagen');
if isequal(FileName,0)
    return
else
    a=imread(strcat(Path,FileName));
    imshow(a);
end