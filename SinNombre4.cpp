#include <windows.h>
#include <stdio.h>
#include <stdlib.h>

int gotoxy(SHORT x, SHORT y);

int main(void)
{
   system("cls");
   
   gotoxy(10, 10);
   printf("mundo");
   
   gotoxy(5, 5);
   printf("Hola, ");
   
   gotoxy(1, 11);
   system("pause");
   
   return EXIT_SUCCESS;
}

