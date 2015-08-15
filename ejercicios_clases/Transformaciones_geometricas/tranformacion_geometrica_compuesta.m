 I=imread('p.jpg');
 
t=45/(2*pi);
 
a=cos(t); b=-sin(t); c=0; d=sin(t);e=cos(t); f=0;
 
t1=[a d 0; b e 0; c f 1];
 
tform = maketform('affine',t1);
 
II = imtransform(I,tform);
 
a=1; b=0; c=0; d=-.2; e=1; f=0;
 
t2=[a d 0; b e 0; c f 1];
 
tform = maketform('affine',t2);
 
III = imtransform(II,tform);
 
a=5; b=0; c=0; d=0; e=5; f=0;
 
t3=[a d 0; b e 0; c f 1];
 
tform = maketform('affine',t3);
 
IV = imtransform(III,tform);
 
tr=t3*t2*t1;
 
tform = maketform('affine',tr);
 
V = imtransform(II,tform);
 
figure,subplot(2,3,1),subimage(I),Title('(a)');
 
subplot(2,3,2),subimage(II),Title('(b)');
 
subplot(2,3,3),subimage(III),Title('(c)');
 
subplot(2,3,4),subimage(IV),Title('(d)');

 figure; imshow(II90); holdon;
 
plot(xy90(:,1),xy90(:,2),'o',u,v,'*');

