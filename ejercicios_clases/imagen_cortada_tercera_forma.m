[Filename Path]=uigetfile('*.jpg','abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(Path,Filename));%a es tipo imagen uint8
    fi=input('ingrese la fila de inicio');
    ff=input('ingrese la fila de fin');
    ci=input('ingrese la columna de inicio');
    cf=input('ingrese la fila de fin');
    a1=im2double(a);
    b=a1(fi:ff,ci:cf,1:3);
    b=im2uint8(b);
    subplot(1,2,1);
    imshow(a);
    title('Imagen Original');
    subplot(1,2,2);
    imshow(b);
    title('Imagen Cortada');
end

