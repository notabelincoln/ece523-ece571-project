/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-float.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "abe-math-float.h"

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	float x;

	const float x_step = 0.000001;

	const float x_sin_min = -4 * M_PI;
	const float x_sin_max = 4 * M_PI;
	
	const float x_poly_min = -6.0;
	const float x_poly_max = 6.0;

	const float poly_coefs[] = {0.0, 0.0, 1.0};
	const int poly_power = 2;

	display = 0;

	/* check if user called program only */
	if (argc == 1) {
		printf("USAGE: run-test-double [OPTIONS]\n");
		return -1;
	}

	/* determine the function the user wants */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "sin", 256) == 0) {
			function = 0;
			break;
		} else if (strncmp(argv[i], "poly", 32) == 0) {
			function = 1;
			break;
		}

	}

	/* determine whether to display the output */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "display", 256) == 0) {
			display = 1;
			break;
		}	
	}

	if (display == 0) { /* run code without displaying results */
		switch (function) {
		case (0):
			for (x = x_sin_min; x <= x_sin_max; x += x_step)
				sin_taylor(x);
			break;
		
		case (1):
			for (x = x_poly_min; x <= x_poly_max; x+= x_step)
				poly_eval(poly_coefs, poly_power, x);
			break;
		}
	} else { /* run code and display results */
		switch (function) {
		case (0):
			printf("%11.7s,%10.7s\n","x","sin_taylor");
			for (x = x_sin_min; x <= x_sin_max; x += x_step)
				printf("%11.7f,%10.7f\n",x,sin_taylor(x));
			break;
		case (1):
			printf("%11s,%11s\n","x","f(x)");

			for (x = x_poly_min; x <= x_poly_max; x+= x_step) {
				printf("%11.7f %11f\n",
						x,
						poly_eval(poly_coefs, poly_power, x));
			}
			break;		
		}
	}

	return 0;
}


