clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    a=imread(strcat(path,filename));
    mf = zeros(51,51);
    mf(26,26)=1;
    b = imfilter(a, mf, 25, 'full');
    imshow(b);
end
