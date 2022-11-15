/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main.c
 */

#include <stdio.h>
#include <math.h>

#include "fixed-point-5-11.h"
#include "abe-math.h"

int main(int argc, char **argv)
{
	double x;

	printf("%6s,%15s,%15s\n", "x", "sin(x)", "sin_taylor(x)");

	for (x = -(2 * M_PI); x <= (2 * M_PI); x += 0.0000001) {
		printf("%6.3lf,%15.10lf,%15.10lf\n", x, sin(x), sin_taylor(x));
	}

	return 0;
}


