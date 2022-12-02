/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-16-16.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "fixed-point-16-16.h"

#ifndef X_STEP_SCALE
#define X_STEP_SCALE 1
#endif

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	fixed_pt x;
	fixed_pt res;
	fixed_pt tmp;
	
	const fixed_pt x_step = 1 * X_STEP_SCALE;

	const fixed_pt x_sin_min = FIXED_PT_MINUS_4_PI;
	const fixed_pt x_sin_max = FIXED_PT_4_PI;
	
	const fixed_pt x_poly_min = -4 * FIXED_PT_1 + 1;
	const fixed_pt x_poly_max = 4 * FIXED_PT_1 - 1;

	const fixed_pt poly_coefs[] = {0, 0, FIXED_PT_1};
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

	tmp = 0;
	res = 0;

	if (display == 0) { /* run code without displaying results */
		switch (function) {
		case (0): // sin
			for (x = x_sin_min; x <= x_sin_max; x += x_step)
				sin_fixed(x);
			break;
		case(1): // polynomial
			for (x = x_poly_min; x <= x_poly_max; x += x_step)
				poly_fixed(poly_coefs, poly_power, x);
			break;
		case (2): // rectangular integration
			for (x = 0; x <= x_sin_max; x += x_step)
				res += area_rect(x_step, sin_fixed(x));
			break;
		case (3): // trapezoidal integration
			for (x = 0; x <= x_sin_max; x += x_step) {
				tmp = add_fixed(x, x_step);
				tmp = area_trap(x_step, sin_fixed(x),
						sin_fixed(tmp));
				res += tmp;
			}
			break;
		case (4): // simpsons rule
			for (x = 0; x <= x_sin_max; x += tmp) {
				tmp = add_fixed(x, 2 * x_step);
				res += sim_fixed(sin_fixed, x, tmp);
			}
			break;	 
		}
	} else { /* run code and display results */
		switch (function) {
		case (0): // sin
			printf("%s,%s\n","x","sin_taylor");
			for (x = x_sin_min; x <= x_sin_max; x += x_step) {
				res = sin_fixed(x);
				printf("%0.14lf,%014lf\n",
						fixed_to_double(x),
						fixed_to_double(res));
			}
			break;
		case(1): // polynomial
			printf("%s,%s\n","x","f(x)");
			for (x = x_poly_min; x <= x_poly_max; x += x_step) {
				res = poly_fixed(poly_coefs, poly_power, x);
				printf("%0.14lf,%0.14lf\n",
						fixed_to_double(x),
						fixed_to_double(res));
			}
			break;
		case (2): // rectangular integration
			printf("%s,%s\n","x","rect");
			for (x = 0; x <= x_sin_max; x += x_step) {
				res += area_rect(x_step, sin_fixed(x));
				printf("%0.14lf,%0.14lf\n",
						fixed_to_double(x),
						fixed_to_double(res));
			}
			break;
		case (3): // trapezoidal integration
			printf("%s,%s\n","x","trap");
			for (x = 0; x <= x_sin_max; x += x_step) {
				tmp = add_fixed(x, x_step);
				tmp = area_trap(x_step, sin_fixed(x),
						sin_fixed(tmp));
				res += tmp;
				printf("%0.14lf,%0.14lf\n",
						fixed_to_double(x),
						fixed_to_double(res));
			}
			break;
		case (4): // simpsons rule
			printf("%s,%s\n","x","simpsons");
			for (x = 0; x <= x_sin_max; x += 2 * x_step) {
				tmp = add_fixed(x, 2 * x_step);
				res += sim_fixed(sin_fixed, x, tmp);
				printf("%0.14lf,%0.14lf\n",
						fixed_to_double(x),
						fixed_to_double(res));
			}
			break;	 
		}
	}

	return 0;
}

