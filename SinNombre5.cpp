#include<conio.h>
#include<stdio.h>
#include<iostream.h>
#include<windows.h>
#include<math.h>
void gotoxy(int filas,int columnas){
     HANDLE hCon;
hCon=GetStdHandle(STD_OUTPUT_HANDLE);
COORD dwPos;
dwPos.X=filas;
dwPos.Y=columnas;
SetConsoleCursorPosition(hCon,dwPos);}
 
int main(){
gotoxy(1,1);
cout<<"holaaaaaaaaaaa";
getch();
}
