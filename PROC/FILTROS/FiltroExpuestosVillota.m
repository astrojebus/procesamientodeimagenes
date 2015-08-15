%Filtro Lineales
clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    I=imread(strcat(path,filename));
    
    subplot(2,5,1);
    imshow(I);
    title('Original Image');
    
    H = fspecial('motion',20,45);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,2);
    imshow(MotionBlur);
    title('Motion Blurred Image');
    
    H = fspecial('disk',10);
    blurred = imfilter(I,H,'replicate');
    subplot(2,5,3);
    imshow(blurred);
    title('Blurred Image');
    
    H = fspecial('average',10);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,4);
    imshow(MotionBlur);
    title('Average');
    
    H = fspecial('gaussian',20,0.8);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,5);
    imshow(MotionBlur);
    title('Gaussian');
    
    H = fspecial('laplacian',0.8);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,6);
    imshow(MotionBlur);
    title('Laplacian 1');
    
    H = fspecial('log',20, 0.8);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,7);
    imshow(MotionBlur);
    title('Laplacian 2');
    
    H = fspecial('motion',18, 1);
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,8);
    imshow(MotionBlur);
    title('Motion');
    
    H = fspecial('prewitt');
    MotionBlur = imfilter(I,H);
    subplot(2,5,9);
    imshow(MotionBlur);
    title('Prewitt Horinzontales');
    MotionBlur = imfilter(I,H');
    imshow(MotionBlur);
    title('Prewitt Vertical');
    
    
    H = fspecial('sobel');
    MotionBlur = imfilter(I,H,'replicate');
    subplot(2,5,9);
    imshow(MotionBlur);
    title('Sobel');
    
end
