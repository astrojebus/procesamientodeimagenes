 I = imread('p.jpg');
 
a=1; b=.2; c=0; d=0; e=1; f=0;
  tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
II = imtransform(I,tform);
 
a=1; b=-.2; c=0; d=0; e=1; f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
III = imtransform(I,tform);
 
a=1; b=0; c=0; d=-.2; e=1; f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
IV = imtransform(I,tform);
 
a=1; b=0; c=0; d=.2; e=1; f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
V = imtransform(I,tform);
 
a=1; b=0; c=30; d=0; e=1; f=30;
 
xform=[a d 0; b e 0; c f 1];
 
tform = maketform('affine',xform);
 
VI = imtransform(I,tform,'XData', [ 1 (size(I,2)+ xform(3,1)) ], 'YData', [ 1 (size(I,1)+ xform(3,2))]);
 
a=5; b=0; c=0; d=0; e=5; f=0;
  
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
VII = imtransform(I,tform);
 
t=45/(2*pi);
 
a=cos(t); b=-sin(t); c=0; d=sin(t);e=cos(t); f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
VIII = imtransform(I,tform);
 
figure,subplot(2,2,1),subimage(I),Title('(a)');
 
subplot(2,2,2),subimage(II),Title('(b)');
 
subplot(2,2,3),subimage(III),Title('(c)');
 
subplot(2,2,4),subimage(IV),Title('(d)');
 
figure,subplot(2,2,1),subimage(V),Title('(e)');
 
subplot(2,2,2),subimage(VI),Title('(f)');
 
subplot(2,2,3),subimage(VII),Title('(g)');
 
subplot(2,2,4),subimage(VIII),Title('(h)');

 subplot(2,3,5),subimage(V),Title('(e)');