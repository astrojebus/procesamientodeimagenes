%www.mathworks.com/helps
[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(path,Filename));
    a1=im2bw(a);
    i=edge(a1);
    subplot(3,3,1);
    imshow(a);
   title('Imagen Orginal');
    subplot(3,3,2);
    imshow(i);
    title('Bordes');
%  SOBEL
    i1=edge(a1,'sobel');
    subplot(3,3,3);
    imshow(i1);
    title('Sobel');
%   SOBEL VERTICAL    
    i2=edge(a1,'sobel','vertical');
    subplot(3,3,4);
    imshow(i2);
    title('Sobel Vertical');
%   CANNY
    i3=edge(a1,'canny');
    subplot(3,3,5);
    imshow(i3);
    title('Canny');
%   ROBERTS
    i4=edge(a1,'roberts');
    subplot(3,3,6);
    imshow(i4);
    title('Roberts');
%   PREWITT
    i5=edge(a1,'prewitt');
    subplot(3,3,7);
    imshow(i5);
    title('Prewitt');
 %   Log
    i6=edge(a1,'log');
    subplot(3,3,8);
    imshow(i6);
    title('LOG');
 %   Zerocross
    i7=edge(a1,'zerocross');
    subplot(3,3,9);
    imshow(i7);
    title('Zerocross');
end
