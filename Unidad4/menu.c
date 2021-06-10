/*********************menu.c********************************/
/******************Compilar con:***************************/
/********gcc -m64 -o3 -Wall menu.c -o menu****************/
/****o bien con, gcc -no-pie -o3 -Wall menu.c -o menu****/
/****************corre con ./menu***********************/
#include <stdio.h>

int a, b, c;

int main(void)
{
    int opc;

    printf("\nSelecciona una opción:\n\n1. Suma\n2. Resta\n3. Multiplicación\n\n");

    scanf("%d", &opc);

    switch(opc) {

        case 1:
            printf("Ingrese un número:\n");
            scanf("%d", &a);
            printf("Ingrese otro número:\n");
            scanf("%d", &b);
            asm (".intel_syntax noprefix");
                asm ("mov   eax, [a]");
                asm ("add   eax, [b]");
                asm ("mov   [c], eax");
            asm (".att_syntax noprefix");

        printf("\nResultado:\n\n%d + %d = %d\n", a, b, c);
            break;
        default:
            break;
    }

        return 0;
}
