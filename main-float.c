/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-float.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "abe-math-float.h"

#ifndef X_STEP_SCALE
#define X_STEP_SCALE 1
#endif

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	float x;
	float tmp;
	float res;

	const float x_step = 0.000001 * X_STEP_SCALE;

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
		if (strncmp(argv[i], "sin", 32) == 0) {
			function = 0;
			break;
		} else if (strncmp(argv[i], "poly", 32) == 0) {
			function = 1;
			break;
		} else if (strncmp(argv[i], "rect", 32) == 0) {
			function = 2;
			break;
		} else if (strncmp(argv[i], "trap", 32) == 0) {
			function = 3;
			break;
		} else if (strncmp(argv[i], "simp", 32) == 0) {
			function = 4;
			break;
		}
	}

	/* determine whether to display the output */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "display", 32) == 0) {
			display = 1;
			break;
		}
	}

	tmp = 0.0;
	res = 0.0;

	if (display == 0) { /* run code without displaying results */
		switch (function) {
		case (0): // sin
			for (x = x_sin_min; x <= x_sin_max; x += x_step)
				sin_taylor(x);
			break;
		case (1): // polynomial
			for (x = x_poly_min; x <= x_poly_max; x+= x_step)
				poly_eval(poly_coefs, poly_power, x);
			break;
		case (2): // rectangular integration
			for (x = 0.0; x <= x_sin_max; x+= x_step)
				res += area_rect(x_step, sin_taylor(x));
			break;
		case (3): // trapezoidal integration
			for (x = 0.0; x <= x_sin_max; x+= x_step) {
				tmp = x + x_step;
				tmp = area_trap(x_step, sin_taylor(x),
						sin_taylor(tmp));
				res += tmp;
			}
			break;
		case (4): // simpsons rule
			for (x = 0.0; x <= x_sin_max; x+= tmp) {
				tmp = 2 * x_step;
				res += sim(sin_taylor, x, x + tmp);
			}
			break;
		}
	} else { /* run code and display results */
		switch (function) {
		case (0): // sin
			printf("%s,%s\n","x","sin_taylor");
			for (x = x_sin_min; x <= x_sin_max; x += x_step)
				printf("%0.11f,%0.11f\n", x, sin_taylor(x));
			break;
		case (1): // polynomial
			printf("%s,%s\n","x","f(x)");
			for (x = x_poly_min; x <= x_poly_max; x+= x_step) {
				printf("%0.11f,%0.11f\n",
						x,
						poly_eval(poly_coefs, poly_power, x));
			}
			break;
		case (2): // rectangular integration
			printf("%s,%s\n","x","rect");
			for (x = 0.0; x <= x_sin_max; x+= x_step) {
				res += area_rect(x_step, sin_taylor(x));
				printf("%0.11f,%0.11f\n", x, res);
			}
			break;
		case (3): // trapezoidal integration
			printf("%s,%s\n","x","trap");
			for (x = 0.0; x <= x_sin_max; x+= x_step) {
				tmp = x + x_step;
				tmp = area_trap(x_step, sin_taylor(x),
						sin_taylor(tmp));
				res += tmp;
				printf("%0.11f,%0.11f\n", x, res);
			}
			break;
		case (4): // simpsons rule
			printf("%s,%s\n","x","simpsons");
			for (x = 0.0; x <= x_sin_max; x += tmp) {
				tmp = 2 * x_step;
				res += sim(sin_taylor, x, x + tmp);
				printf("%0.11f,%0.11f\n", x, res);
			}
			break;
		}
	}

	return 0;
}

