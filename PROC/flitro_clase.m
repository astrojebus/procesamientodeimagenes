clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
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
     title('Motion blur Image');
     
      H=fspecial('disk',10);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,3);
     imshow(blurred);
     title('blurred Image');
     
     H=fspecial('sobel');
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,4);
     imshow(blurred);
     title('blurred Image');
     
     H=fspecial('average',[3 3]);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,5);
     imshow(blurred);
     title('blurred Image');
     
     
     H=fspecial('laplacian', 0.2);
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,6);
     imshow(blurred);
     title('blurred Image');
     
     
      H=fspecial('prewitt');
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,7);
     imshow(blurred);
     title('blurred Image');
     
      H=fspecial('log', [3 3], 2)  ;
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,8);
     imshow(blurred);
     title('blurred Image');
     
      H=fspecial('gaussian', [3 3],0.5)  ;
     blurred=imfilter(I,H,'replicate');
     subplot(2,5,9);
     imshow(blurred);
     title('blurred Image');
    
  
end
