/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main.c
 */

#include <stdio.h>
#include <math.h>

#include "fixed-point-5-11.h"

int main(int argc, char **argv)
{
	double x;
	double f_x_double;

	printf("%5s,%10s,%10s\n","x","gcc","fixed");

	for (x = -M_PI / 2; x <= M_PI / 2; x += 0.01) {
		f_x_double = (double)sin_fixed(double_to_fixed(x)) / 2048;
		printf("%5.2lf,%10.7lf,%10.7lf\n", x, sin(x), f_x_double);
	}

	return 0;
}


