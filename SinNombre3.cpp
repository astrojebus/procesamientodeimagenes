#include<stdio.h>
#include<iostream.h>
#include<windows.h>
main()
{
      int m[3][3],x,y,h,f,c,;
      y=1;
      h=0;
      for(f=0;f<=2;f++)
      {
        x=2;
        for(c=0;c<=2;c++)
        {
          gotoxy(x,y);
          cin>>m[f][c];
          h=h+m[f][c];
          x=x+3;
        }
        y=y+3;
      }
        cout<<"El resultado es:"<<h;
getch();
}
