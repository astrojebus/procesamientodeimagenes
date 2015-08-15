clc;
[filename path]=uigetfile('*.jpg','Abrir imagen');
if isequal(filename,0)
    return;
else
    A=imread(strcat(path,filename));
    
    Arojo = A(:,:,1);
    Averde = A(:,:,2);
    Aazul = A(:,:,3);
    
    A = rgb2gray(A);
    
    subplot(1,3,1);
    fun=@(x)max(x(:));
    B(:,:,1) = nlfilter(Arojo,[3 3], fun);
    B(:,:,2) = nlfilter(Averde,[3 3], fun);
    B(:,:,3) = nlfilter(Aazul,[3 3], fun);
    imshow(B);
    
    subplot(1,3,2);
    fun=@(x)min(x(:));
    B(:,:,1) = nlfilter(Arojo,[3 3], fun);
    B(:,:,2) = nlfilter(Averde,[3 3], fun);
    B(:,:,3) = nlfilter(Aazul,[3 3], fun);
    imshow(B);
    
    subplot(1,3,3);
    fun=@(x)median(x(:));
    B(:,:,1) = nlfilter(Arojo,[3 3], fun);
    B(:,:,2) = nlfilter(Averde,[3 3], fun);
    B(:,:,3) = nlfilter(Aazul,[3 3], fun);
    imshow(B);
    
end