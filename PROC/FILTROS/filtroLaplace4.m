clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    a=imread(strcat(path,filename));
    mf = zeros(501,1);
    mf(800,1)=1;
    %b = imfilter(a, mf, 'replicate', 'full');
    b = imfilter(a, mf, 'symmetric', 'full');
    imshow(b);
end
