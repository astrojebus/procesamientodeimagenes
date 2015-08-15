
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
#include<windows.h>
#include<math.h>
//Declaracion de los Using
using namespace std;

//Inicion Funcion MAIN del Programa
int  main()
{
//Declaracion de las Variables
int fila,columna,bit,base;
int matriz[10][10];
//Ingreso de la cantidad de filas y columna
cout << "Ingrese el numero de pixeles horizontales: " ;
cin >> fila;
cout << "Ingrese el numero de pixeles verticales: " ;
cin >> columna;
cout << "Ingrese el bit de cada pixel: " ;
cin>> bit;

//Cambio de tamaño en la matriz 
mat riz[1][1]=matriz[fila][columna];

//Muestra del nuevo tamaño de la matriz
cout << "\nLa nueva matriz es de " << fila << "x" << columna << "\n\n";

//Ingreso de los componentes de la matriz
bit=(pow(2,bit)-1);
for(int i=0;i<fila;i++)
{
for(int n=0;n<c olumna;n++)
{ if(bit<=255) {
cout << "Ingr ese el valor de [" << i+1 << "][" << n+1 << "] : " ;
ci n >> matri z[i][n];}
} 
}  
 
// Muestra de la matriz ingresa
c out << "\nLa matriz guardada es \n\n";
 
for(int i = 0; i < fila; i++)
{
fo r(int n = 0; n < columna; n++)
{ 
cout << matriz[i][n];
}
cout << endl; 
} 

system("pause");

}
 
