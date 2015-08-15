clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    img=imread(strcat(path,filename));
    subplot(3,3,1);
    imshow(img);
    title('Imagen Original');
    img1=imrotate(img,45);
    imshow(img1);
    title('Rotacion 45°');
    img2=imrotate(img,135);
    subplot(3,3,3);
    imshow(img2);
    title('Rotacion 135°');
    img3(:,:,1)=flipud(img(:,:,1));
    img3(:,:,2)=flipud(img(:,:,2));
    img3(:,:,3)=flipud(img(:,:,3));
    subplot(3,3,4);
    imshow(img3);
    title('Imagen Rotada');
    
    img4(:,:,1)=fliplr(img(:,:,1));
    img4(:,:,2)=fliplr(img(:,:,2));
    img4(:,:,3)=fliplr(img(:,:,3));
    subplot(3,3,5);
    imshow(img4);
    title('Imagen Rotada');
    
    img5=imresize(img,[50 50]);
    subplot(3,3,6);
    imshow(img5);
    axis on;
    title('Disminucion');
    
    img6=imresize(img,[1000 750]);
    subplot(3,3,6);
    imshow(img6);
    axis on;
    title('Aumento');
    [m n dim]=size(img);
    imgaux=zeros(m,n,dim);
    f=100; %Mover a la fila 20
    for i=1:m
        c=150; %Mover a la columna 20
        for j=1:n
            imgaux(f,c,:)=img(i,j,:);
            c=c+1;
        end
        f=f+1
    end
    imgaux=uint8(imgaux);
    subplot(3,3,8);
    imshow(imgaux);
    title('Traslacion');
end