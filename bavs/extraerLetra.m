%Porcentaje de determinacion del numero de objetos de una imagen
clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    img=imread(strcat(path,filename));
    figure;
    imshow(img);
    umbral=graythresh(img);
    bw=im2bw(img,umbral);
    bw=~bw;%Saca complemento de la imagen
    figure;
    imshow(bw);
    [x y]=find(bw);
    xsup=max(x);%Esquina superior
    ysup=max(y);
    xinf=min(x);%Esquna inferior
    yinf=min(y);
    d=bw(xinf:xsup,yinf:ysup);%Recortando
    figure;
    imshow(d);
    [L Num]=bwlabel(d);
    for i=1:Num
        extraer=roicolor(L,i);
        [x y]=find(extraer);
        xsup=max(x);%Esquina superior
        ysup=max(y);
        xinf=min(x);%Esquna inferior
        yinf=min(y);
        e=extraer(xinf:xsup,yinf:ysup);%Recortando
        figure;
        imshow(e);
    end
end