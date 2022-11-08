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

	for (x = -M_PI / 2; x <= M_PI / 2; x += 0.01)
		printf("%5.2lf,%10.7lf,%10.7lf\n",
				x,
				sin(x),
				(double)sin_fixed(double_to_fixed(x)) / 2048);

	return 0;
}
