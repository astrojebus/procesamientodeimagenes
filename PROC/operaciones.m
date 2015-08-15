clc;
clear all;
[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    a=imread(strcat(ruta,archivo));
  
end

[archivo ruta]=uigetfile({'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    b=imread(strcat(ruta,archivo));
  
end


[m n dim]=size(a);
b=imresize(b,[m n]);
c=a+b;
d=a-b;
subplot(3,3,1);
imshow(a);
title('imagen A');

subplot(3,3,2);
imshow(b);
title('imageb b');
subplot(3,3,3);
imshow(c);
title('A+B');
subplot(3,3,4);
imshow(d);
title('A-B');
a=im2bw(a,0.7);
b=im2bw(b,0.7);
e=and(a,b);
subplot(3,3,5);
imshow(e);
title('a and b');
f=or(a,b);
subplot(3,3,6);
imshow(f);
title('a or b');
subplot(3,3,7);
imshow(b);
title('B');
g=not(b);
subplot(3,3,8);
imshow(g);
title('negado b');
h=not(and(a,not(b)));
subplot(3,3,9);
imshow(h);
title('negado a and not b');







