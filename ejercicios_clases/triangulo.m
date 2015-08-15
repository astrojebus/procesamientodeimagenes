a=ones(500,700);
i=350;
j=350;
for f=100:400
    for c=i:j;
 a(f,c)=0; %asigno color negro.
    end
    i=i-1;
    j=j+1;
end 
imshow(a);
title('triangulo');
[FileName Path]=uiputfile('Guardar imagen');
if isequal(FileName,0)
    return;
else
    imwrite(a,strcat(Path,FileName));
end
