#include <stdio.h>
extern int fsuma(int, int);
extern int fproducto(int, int);
extern int factorial(int);

int main()
{
	int x, y, result;
	printf("\nIntroduce el valor de x: ");
	scanf("%d", &x);
	printf("Introduce el valor de y: ");
	scanf("%d", &y);
	result = fsuma(x, y);
	printf ("\nLa suma de %d y %d es %d\n", x, y, result);
	result = fproducto(x, y);
	printf ("El producto de %d por %d es %d\n", x, y, result);
	result = factorial(x);
	printf ("El factorial de %d es %d\n", x, result);
	return 0;
}
