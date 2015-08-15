fi=250;
ff=350;
ci=300;
cf=400;

for i=1:10 %Numero de repeticiones
a=ones(500,700);
for f=fi:ff
    for c=ci:cf
        a(f,c)=0;
    end
end
imshow(a);
pause(1);
fi=fi-20;
ff=ff+20;
ci=ci-20;
cf=cf+20;
end