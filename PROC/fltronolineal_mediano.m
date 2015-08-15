
%corrige el ruido como  el lineal promedio
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
aRojo=a(:,:,1);
aVerde=a(:,:,1);
aAzul=a(:,:,1);
fun=@(x)median(x(:));
b(:,:,1)=nlfilter(aRojo,[3 3], fun);
b(:,:,2)=nlfilter(aVerde,[3 3], fun);
b(:,:,3)=nlfilter(aAzuk,[3 3], fun);
imshow(b)
end