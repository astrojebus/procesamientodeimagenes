
[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
a=imread(strcat(path,Filename));
figure,imshow(a);title('RGB Image');
%Representar a la imagen RGB en un rango de[0 1]
I=double(a)/255;
%establecemos la matriz de los componentes rojo,verde y azul
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%En el sistema HSI, el tono de un color es su medida de ángulo en una rueda de color. 
%Tonos rojos puros son 0 °, tonalidades verdes puros son 120 °, y el blues puros son 240 °.
%(Los colores neutros - blanco, gris y negro -. Están ajustados a 0 ° para mayor comodidad)

%Hue sacamos el tono de un color que es su medida de ángulo
%2 parametros
numi=1/2*((R-G)+(R-B));%numerador
denom=((R-G).^2+((R-B).*(G-B))).^0.5;%denominador

%Para evitar la división para cero le sumamos un pequeño número en el denominador
H=acosd(numi./(denom+0.000001));%acosd devuelve el coseno inverso (cos -1 ) de los elementos de la division en grados.

%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);

%Normalize to the range [0 1]
H=H/360;

%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);%min devuelve los elementos más pequeños a lo largo de las diferentes dimensiones de una matriz.;

%Intensity
I=sum(I,3)./3;%sum=suma los elementos de la imagen I a los largo de la dimension 3

%HSI
HSI=zeros(size(a));%devuelve el tamano de las dimensiones de la matriz "a"
HSI(:,:,1)=H;%asignamos el valor del tono en el componente R
HSI(:,:,2)=S;%asignamos el valor de la saturacion en el componente G
HSI(:,:,3)=I;%asignamos el valor de la intesidad en el componente B
figure,imshow(HSI);title('HSI Image');
end
