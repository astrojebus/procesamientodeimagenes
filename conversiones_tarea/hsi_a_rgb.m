
[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');%la imagen debe estar de tipo hsi
if isequal(Filename,0)
    return;
else 
HSI=imread(strcat(path,Filename));
figure,imshow(HSI);title('HSI Image');  
%Representar a la imagen HSI en un rango de[0 1]
HSI=double(HSI)/255;

 %Obetenemos los componentes del tono ,saturacion e intensidad  
 H1=HSI(:,:,1);  
 S1=HSI(:,:,2);  
 I1=HSI(:,:,3);  
 
 %Multiplicamos el tono por 360 para representar el rango entre [0 360]
 H1=H1*360;                                               
    
% Asignamos previamente los componentes RGB sacando sus respectivos tamanos
% con los comandos zeros(size)
 R1=zeros(size(H1));  
 G1=zeros(size(H1));  
 B1=zeros(size(H1));  
 RGB1=zeros([size(H1),3]);%devuelve el tamano de la matriz "H1" solo en la dimencion del componente "B". 
 
 %RG Sector(0<=H<120)Cuando en los componentes RG el sector del tono "H" es igual o mayor a cero y menor a 120  
 %"H" se encuentra en el sector anterior por lo tanto las ecuaciones de los componentes RGB en funcion del sector
 %"H" son:
 B1(H1<120)=I1(H1<120).*(1-S1(H1<120));  
 R1(H1<120)=I1(H1<120).*(1+((S1(H1<120).*cosd(H1(H1<120)))./cosd(60-H1(H1<120))));%utilizamos el comando "cosd "para sacar el coseno 
% de una determinada operacion
 G1(H1<120)=3.*I1(H1<120)-(R1(H1<120)+B1(H1<120));  
 
 %GB Sector(120<=H<240)Cuando en los componentes GB el sector del tono "H" es igual o mayor a 120 y menor a 240  
 %"H" se encuantra en el sector anterior por lo tanto las ecuaciones de los componentes RGB en funcion del sector
 %"H" son:
 %Sustraemos el valor de 120 de "Hue" o sea del tono llamado "H1" 
 H2=H1-120;%para poder sacar el tono 2 llamado "H2".  
 R1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1-S1(H1>=120&H1<240));  
 G1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1+((S1(H1>=120&H1<240).*cosd(H2(H1>=120&H1<240)))./cosd(60-H2(H1>=120&H1<240))));
 B1(H1>=120&H1<240)=3.*I1(H1>=120&H1<240)-(R1(H1>=120&H1<240)+G1(H1>=120&H1<240));  
 
 %BR Sector(240<=H<=360)Cuando en los componentes BR el sector del tono "H" es igual o mayor a 240 y menor a 360  
 %"H" se encuantra en el sector anterior por lo tanto las ecuaciones de los componentes RGB en funcion del sector
 %"H" son:
 %Sustraemos el valor de 240 de "Hue"
 H2=H1-240;%para poder sacar el tono 2 llamado "H2".  
 G1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1-S1(H1>=240&H1<=360));  
 B1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1+((S1(H1>=240&H1<=360).*cosd(H2(H1>=240&H1<=360)))./cosd(60-H2(H1>=240&H1<=360))));  
 R1(H1>=240&H1<=360)=3.*I1(H1>=240&H1<=360)-(G1(H1>=240&H1<=360)+B1(H1>=240&H1<=360));  
 
%Formamos los componentes RGB asignandole sus respectivas variables
%resultantes
 RGB1(:,:,1)=R1;  
 RGB1(:,:,2)=G1;  
 RGB1(:,:,3)=B1;  
%Represent the image in the range [0 255]  
 RGB2=im2uint8(RGB1);%convierte la imagen de color verdadero RGB1 de doble precisión, cambiar la escala de los datos si es necesario.  
 figure,imshow(RGB2);title('RGB Image');  
end   