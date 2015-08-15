clear all;
a=imread('C:\Users\Public\Pictures\Sample Pictures\Koala.jpg');
b=imread('C:\Users\Public\Pictures\Sample Pictures\faro.jpg');
c=imread('C:\Users\Public\Pictures\Sample Pictures\desierto.jpg');

subplot(2,2,1);
imshow(a);
title('imagen a');
subplot(2,2,2);
imshow(b);
title('imagen b');
subplot(2,2,3)
imshow(c);
title('imagen c');
