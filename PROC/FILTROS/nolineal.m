clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)
 return 
else
 
    a=imread(strcat(ruta,archivo));
    
     subplot(2,2,1);
     imshow(a);
     title('IMAGEN ORIGINAL');
     
    
    b=imnoise(a,'salt & pepper',0.1);
    subplot(2,2,2);
    imshow(b);
    title('PONE RUIDO');
  
    arojo=a(:,:,1);
    averde=a(:,:,2);
    aazul=a(:,:,3);
    
    fun=@(x)max(x(:));
    b(:,:,1)=nlfilter(arojo,[3 3],fun);
    b(:,:,2)=nlfilter(averde,[3 3],fun);
    b(:,:,3)=nlfilter(aazul,[3 3],fun);
    subplot(2,2,3);
    imshow(b);
    title('QUITA RUIDO');
    
    
    arojo=a(:,:,1);
    averde=a(:,:,2);
    aazul=a(:,:,3);
    
    fun=@(x)median(x(:));
    b(:,:,1)=nlfilter(arojo,[4 4],fun);
    b(:,:,2)=nlfilter(averde,[4 4],fun);
    b(:,:,3)=nlfilter(aazul,[4 4],fun);
    subplot(2,2,4);
    imshow(b);
    title('QUITA RUIDO PROMEDIO');
    
    
    
    
    
    
  
    
    
     
end
