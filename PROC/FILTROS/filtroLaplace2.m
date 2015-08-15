clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return
else
    a=imread(strcat(path,filename));
    mf = [1 2 3 4 5 6 7 8; 9 10 11 12 13 14 15 16; 17 18 19 20 21 22 23 24; 25 26 27 28 29 30 31 32; 33 34 35 36 37 38 39 40]/820;
    b = imfilter(a, mf, 'corr');
    c = imfilter(a, mf, 'conv')
    subplot(1,3,1);
    imshow(a);
    subplot(1,3,2);
    imshow(b);
    subplot(1,3,3);
    imshow(c);
end
