 I=imread('p.jpg');
 
II=rgb2gray(I);
 t=45;
a=cos(t); b=-sin(t); c=0; d=sin(t);e=cos(t); f=0;
 
t1=[a d 0; b e 0; c f 1];
 
tform = maketform('affine',t1);
 
II45 = imtransform(II,tform);
 
cpselect(II45, II)

tform = cp2tform(input_points,base_points,'projective');
 
[alineada xdata ydata] =imtransform(II45, tform,'FillValues',255);
 
figure; imshow(alineada,'XData', xdata,'YData', ydata)
 
holdon
 
imshow(II);