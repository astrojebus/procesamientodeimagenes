

clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
  fun=@(x)max(x(:));
  b=nlfilter(a,[5 5],fun);
  imshow(b);
end