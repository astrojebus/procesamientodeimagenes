
[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
  I= imread(strcat(ruta,archivo));


II=rgb2gray(I);
 
a=1; b=0; c=0; d=-.6; e=1; f=0;
 
tform = maketform('affine',[a d 0; b e 0; c f 1]);
 
% Tres transformaciones con diferenteinterpolación
 
IIIn = imtransform(II,tform,'nearest');
 
IIIb = imtransform(II,tform,'bilinear');
 
IIIbc = imtransform(II,tform,'bicubic');
 
subplot(2,2,1);
imshow(II);
 
subplot(2,2,2);
imshow(IIIn);

 subplot(2,2,3);
imshow(IIIb);

 subplot(2,2,4);
imshow(IIIbc);
end
 