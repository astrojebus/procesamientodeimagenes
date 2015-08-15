a=imread('c:\carr.jpg');
m=[0.1 0.2 0.3;0.4 0.5 0.6;0.7 0.8 0.9];
f=imfilter(a,m,'corr');
subplot(1,2,1);
imshow(a);
title('imagen original');
subplot(1,2,2);
imshow(f);
title('imagen correlacion');