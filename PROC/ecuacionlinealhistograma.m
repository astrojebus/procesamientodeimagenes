clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));


b=rgb2gray(a);
[cont x]=imhist(b);
[m n]=size(b); 
va=0, 
for v=1:256
    H(v)=va+cont(v);
va=H(v); 
end %Equilibra linealmente utilizando la información del histograma %acumulativo. 
for r=1:m 
    for c=1:n 
        ac=a(r,c);
        imp(r,c)=H(ac+1)*(255/(m*n));
    end
end
imp=mat2gray(imp);
subplot(1,2,1);
imshow(b);
title('imagen original');
subplot(1,2,2);
imshow(imp);
title('imagen mejorada');

end