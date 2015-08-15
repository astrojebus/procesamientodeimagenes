clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)
 return 
else
 
    I=imread(strcat(ruta,archivo));
    subplot(2,5,1);
     imshow(I);
     title('Imgan Original');
     
     H=fspecial('motion',20,45);
     MotionBlur=imfilter(I,H,'replicate');
     subplot(2,5,2);
     imshow(MotionBlur);
     title('MOTION BLUR IMAGEM');
     
      H=fspecial('disk',10);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,3);
     imshow(blurred);
     title('BLURRED IMAGE');
     
     H=fspecial('sobel');
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,4);
     imshow(blurred);
     title('SOBEL');
     
     H=fspecial('average',[3 3]);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,5);
     imshow(blurred);
     title('PROMEDIO');
     
     
     H=fspecial('laplacian', 0.2);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,6);
     imshow(blurred);
     title('LAPLACIANO 3X3');
     
     
      H=fspecial('prewitt');
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,7);
     imshow(blurred);
     title('PREWITT');
     
      H=fspecial('log', [3 3], 2)  ;
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,8);
     imshow(blurred);
     title('LAPLACIANO');
     
      H=fspecial('gaussian', [3 3],0.5)  ;
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,9);
     imshow(blurred);
     title('GUSIANO');
    
  
end
