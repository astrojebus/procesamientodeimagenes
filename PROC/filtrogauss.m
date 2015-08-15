
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
 mf=[1 4 7 4 1;4 20 33 20 4;7 33 55 33 7;4 20 33 20 4;1 4 7 4 1]/331;
b= imfilter(a,mf);
subplot(1,2,1);
imshow(a);
title('original');
subplot(1,2,2);
imshow(b);
title('imagen fikltro gauss');

end