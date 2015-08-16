[file path]=uigetfile('*.jpg','abrir');
if isequal(file,0)
    return
else
    a=imread(strcat(path,file));
    subplot(2,2,1);
    imshow(a);
    title('imagen original');
    b=rgb2gray(a)
    subplot(2,2,2);
    imshow(b);
    title('Imgen a EScala de grises2');
    c=im2bw(a);
    subplot(2,2,3);
    imshow(c);
    title('imagen blanco y negro');
    umbral=graythresh(a);
    fprintf('umbral optimo: %0.2f',umbral);
    d=im2bw(a,umbral);
    subplot(2,2,4);
    imshow(d);
    title('imagen blanco y negro u,bral 0.1');
    %[x map]=gray2ind(b,255);
    %subplot(2,2,4);
    %imshow(x,map);
    %title('imagen indexada');
end

