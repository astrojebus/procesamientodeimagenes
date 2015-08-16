[file path]=uigetfile('*.jpg','abrir');
if isequal(file,0)
    return
else
    a=imread(strcat(path,file));
    for i=0:0.1:1   %0.1 INCREMENTO , DE 0 A 1
         b=im2bw(a,i)
         imshow(b);
         pause(0.5);
    end
   
end

