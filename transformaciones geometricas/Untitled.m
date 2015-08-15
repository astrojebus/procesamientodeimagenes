 I=imread('p.jpg');
 
II=rgb2gray(I);
 
a=1; b=0; c=0; d=-.6; e=1; f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
% Tres transformaciones con diferenteinterpolación
 
IIIn = imtransform(II,tform,'nearest');
 
IIIb = imtransform(II,tform,'bilinear');
 
IIIbc = imtransform(II,tform,'bicubic');
 
figure,subplot(2,2,1),subimage(II),Title('(1a)');
 
subplot(2,2,2),subimage(IIIn),Title('(1b)');
 
subplot(2,2,3),subimage(IIIb),Title('(1c)');

subplot(2,2,4),subimage(IIIbc),Title('(1d)');figure,subplot(2,2,1),subimage(IIIn),Title('(2a)');
 
subplot(2,2,2),subimage(IIIb),Title('(2b)');
 
subplot(2,1,2),subimage(IIIbc),Title('(2c)');
 