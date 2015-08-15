
clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
    a=rgb2gray(a);
b= edge(a,'sobel');
imshow(b);
end