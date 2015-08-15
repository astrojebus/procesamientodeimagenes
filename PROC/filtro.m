

clc;
clear all;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
   return  
else
    a=imread(strcat(path,filename));
    

[m n o]=size(a);
b=double(a); 
r=b; 
for i=2:m-1
    for j=2:n-1 
        for k=1:3 
            r(i,j,k)=1/9*(b(i-1,j-1,k)+b(1-1,j,k)+b(i-1,j+1,k)+b(i,j-1 ,k)+b(i,j,k)+b(i,j+1 ,k)+b(i+1, 4 -1 ,k)+b(i+1,j,k)+b(i+1,j+1 ,k)); 
        end
    end
end
r=uint8(r); 
subplot(1,2,1)
imshow(a); 
title('lmagen Original');
subplot(1,2,2)
imshow(r);
titl ('lmagen con Suavizadol');
end