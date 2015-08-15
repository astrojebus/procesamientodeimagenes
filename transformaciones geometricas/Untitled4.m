I=imread('p.jpg');%leemos la imagen original.
t=45/(2*pi);%asignamos el valor a "t" donde t va ser el angulo y pi=es una valor const de 3.14.
a=cos(t); b=-sin(t); c=0; d=sin(t); e=cos(t); f=0;%asignamos respectivamente los valores de
%las matrices a las variables establecidas.
t1=[a d 0; b e 0; c f 1];%formamos la matriz de 3D (3*3) en la variable "t1";
tform = maketform('affine',t1);%maketform crea una estructura multidimensional espacial y affine es
%el tipo de tranformacion q se va a crear en este caso es en 2D y N-D.
II = imtransform(I,tform);%transforma la imagen I de acuerdo con la transformación espacial 2-D
%definido por tform. 
a=1; b=0; c=0; d=-.2; e=1; f=0;
t2=[a d 0; b e 0; c f 1];%formamos la matriz de 3D (3*3) en la variable "t2";
tform = maketform('affine',t2);
III = imtransform(II,tform);%transforma la imagen II
a=5; b=0; c=0; d=0; e=4; f=0;
t3=[a d 0; b e 0; c f 1];%formamos la matriz de 3D (3*3) en la variable "t3";
tform = maketform('affine',t3);
IV = imtransform(III,tform);%transforma la imagen III
tr=t3*t2*t1;%realizamos un producto matricial con las diferentes transformaciones
tform = maketform('affine',tr);
V = imtransform(IV,tform);%transforma la imagen IV
%MOSTRAMOS LAS IMAGENES TRANSFORMADAS CON SUBPLOT.
figure, subplot(2,3,1),subimage(I),Title('(a)');%mostrasmos la imagen original con suplot
subplot(2,3,2),subimage(II),Title('(b)');%Transformación con ángulo de rotación;
subplot(2,3,3),subimage(III),Title('(c)');%Empuje vertical;
subplot(2,3,4),subimage(IV),Title('(d)');%Ampliación;
subplot(2,3,5),subimage(V),Title('(e)');%Producto matricial