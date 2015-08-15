#include<conio.h>
#include<iostream.h>
int main()
{
gotoxy( 20, 1 );
cout<<"tincho";
return 0;
} 
COORD c;
HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
. . . .
c.x=10;
c.y=5;
SetConsoleCursorPosition (hStdout, c);
. . . .
c.x=40;
c.y=15;
SetConsoleCursorPosition (hStdout, c); 
