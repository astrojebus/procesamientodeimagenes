clear all;
clc;
a=imread('c:\paisaje.jpg');
b=rgb2gray(a);
[cont, x]=imhist(b);
acum=0;
for i=1:256
    h(i)=acum+cont(i);
    acum=h(i);
end
stem(x,h);