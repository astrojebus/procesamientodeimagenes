
[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else

    %Leemos la imagen original, un cubo RGB sobre fondo blanco:
   rgb=imread(strcat(path,Filename));
    imshow(rgb);
   %c=double(rgb)/255;

    %Obtenemos la imagen hsi:
    hsi=rgb2hsi(c);

    %Obtenemos cada una de las bandas de la imagen HSI:
    H=hsi(:,:,1);S=hsi(:,:,2);I=hsi(:,:,3);
    %figure,imshow(H);
   %Mostramos la componente en H (tono): Existe una discontinuidad a lo largo de los 45� en el plano rojo del cubo.
    figure,imshow(H);

    %Mostramos la componente en S (saturaci�n). Esta componente muestra valores progresivamente m�s oscuros hacia el v�rtice blanco del cubo RGB, indicando que los colores est�n cada vez menos saturados a medida que se aproximan al blanco.
    figure,imshow(S);

    %Mostramos la componente en I (intensidad). Cada p�xel es el promedio de los p�xeles correspondientes en la imagen RGB. El fondo de la imagen es blanco porque tambi�n lo es en la imagen original. El fondo es negro en las otras dos componentes porque el tono y la saturaci�n del blanco son cero.
    figure,imshow(I);
end