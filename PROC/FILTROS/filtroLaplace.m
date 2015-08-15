clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    a=imread(strcat(path,filename));
    mf = [0 0 -1 0 0;0 -1 -2 -1 0;-1 -2 16 -2 -1;0 -1 -2 -1 0;0 0 -1 0 0];
    b = imfilter(a, mf);
    subplot(1,2,1);
    imshow(a);
    subplot(1,2,2);
    imshow(b);
end
