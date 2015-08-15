%Porcentaje de determinacion del numero de objetos de una imagen
clc;
[filename path]=uigetfile('*png','Abrir imagen');
if isequal(filename,0)
    return
else
    cont = 0;
    img=imread(strcat(path,filename));
    umbral = graythresh(img);
    bw = im2bw(img, umbral);
    bw = imfill(bw,'holes');
    [L Num]=bwlabel(bw);
    imshow(img);
    disp('Numero de objetos de la imagen: ');
    disp(Num);
    %prop=regionprops(L,'area','perimeter','boundingbox','centroid');
    %ar=prop(1).Area
    %disp(ar);
    %for i=1:Num
    %    if prop(i).Area < 1900 && prop(i).Area>1000
    %        rectangle('Position',prop(i).BoundingBox,'EdgeColor','g','LineWidth',2);
    %        cont=cont+1;
    %    end
    %end
    %disp('Objetos encerrados. ');
    %disp(cont);
    
    extraer=roicolor(L,5);
    imshow(extraer);
end
