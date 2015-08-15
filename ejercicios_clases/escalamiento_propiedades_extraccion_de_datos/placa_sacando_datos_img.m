a=imread('c:\placa.jpg');
a=imcrop(a);%recortar imagen
%figure;
%imshow(a);
eg=rgb2gray(a);
bn=im2bw(eg,0.5);
%figure;
%imshow(bn);
c=~bn;
figure;
imshow(c);
%Buscar las esquinas
[fil col]=find(c);
xmax=max(fil);
xmin=min(fil);
ymax=max(col);
ymin=min(col);
d=c(xmin:xmax,ymin:ymax);%sacando las esquinas
figure;
imshow(d);
[L num]=bwlabel(d);
for i=1:num
   letra=roicolor(L,i);
   [fil col]=find(letra);
    xmax=max(fil);
    xmin=min(fil);
    ymax=max(col);
    ymin=min(col);
    corte=letra(xmin:xmax,ymin:ymax);
    figure;
    imshow(corte);
end