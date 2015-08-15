#include"iostream.h"
#include"conio.h"
#include"iomanip.h"
main()
{
  int h,v,i,j,im[100][100],ff,cc,f,c;
  float prom,sum;
  cout<<"Ingrese el numero de pixeles horizontales: ";
  cin>>h;
  cout<<"Ingrese el numero de pixeles verticales: ";
  cin>>v;
  cout<<"Ingrese la intensidad de cada pixel:\n";
  for (i=1;i<=h;i++)
   {
     for (j=1;j<=v;j++)
      {
        cout<<"r("<<i<<")("<<j<<") = ";
        cin>>im[i][j];               
      }                
   }
  cout<<"Escriba la posicion del pixel:\n";
  cout<<"Horizontal: ";
  cin>>ff;
  cout<<"Vertical: ";
  cin>>cc;
  sum=0;
  for(f=ff-1;f<=ff+1;f++)
   {
       for(c=cc-1;c<=cc+1;c++)
        {
          sum=sum+im[f][c];
        }                  
   }
  prom=sum/9;
  cout<<"Promedio vecindad 8: "<<fixed<<setprecision(2)<<prom;
  getch();
}
