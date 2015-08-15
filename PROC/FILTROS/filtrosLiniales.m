clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)
 return 
else
 
    a=imread(strcat(ruta,archivo));
    
     subplot(2,3,1);
     imshow(a);
     title('IMAGEN ORIGINAL');
     
    mf=fspecial('average',[11 11]);
    b=imfilter(a,mf);
    subplot(2,3,2);
    imshow(b);
    title('FILTRO PROMEDIO');
    
    p=fspecial('prewitt');
    c=imfilter(a,p);
    subplot(2,3,3);
    imshow(c);
    title('BORDES HORIZONTALES');
    
    
    p=fspecial('prewitt');
    d=imfilter(a,p');
    subplot(2,3,4);
    imshow(d);
    title('BORDES VERTICALES');
    
    e=c+d;
    subplot(2,3,5);
    imshow(e);
    title('BORDES V+H');
    
     
end
