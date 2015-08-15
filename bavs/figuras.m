clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    img=imread(strcat(path,filename));
    umbral=graythresh(img);
    bw=im2bw(img,umbral);
    [L Num]=bwlabel(bw);
    imshow(img);
    disp('Numero de objetos: ');
    disp(Num);
    %rgb=label2rgb(L);
    %imshow(rgb);
    p=regionprops(L,'area','perimeter','boundingbox','centroid');
    per=p(2).Perimeter;
    msgbox(sprintf('El perimetro del objeto uno es: %0.2f',per),'Perimetro');
    ar=p(2).Area;
    msgbox(sprintf('El area del objeto uno es: %0.2f',ar),'Area');
    coor=p(2).BoundingBox;
    msgbox(sprintf('La coordenadas de inico son: %0.2f %0.2f',coor(1),coor(2)),'Coordenada');
    cg=p(2).Centroid;
    msgbox(sprintf('Centro de gravedad: %0.2f %0.2f',cg(1),cg(2)),'Gravedad');
    rectangle('Position',p(2).BoundingBox,'EdgeColor','r','LineWidth',2);
    hold on;
    plot(cg(1),cg(2),'*');
end
