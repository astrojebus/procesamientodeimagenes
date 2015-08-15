clear all;
[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
    a=imread(strcat(ruta,archivo));
    imshow(a);
end