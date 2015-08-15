[Filename Path]=uigetfile('*.jpg','abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(Path,Filename));%a es tipo imagen uint8
    subplot(1,2,1);
    imshow(a);
    title('Imagen Original');
    a=im2double(a); %a es tipo mdoble
    b=a(20:100,50:300,1:3);
    b=im2uint8(b);% b a imagen
    subplot(1,2,2);
    imshow(b);
    title('Imagen Cortada');
end