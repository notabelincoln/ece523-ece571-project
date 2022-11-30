/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-32-32.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "fixed-point-32-32.h"

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	fixed_pt x;
	const fixed_pt x_step = ((fixed_pt)1 << 12);

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
		}
	}

	/* determine whether to display the output */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "display", 256) == 0) {
			display = 1;
			break;
		}
	}

	if (display == 0) {
		switch (function) {
		case (0):
			for (x = FIXED_PT_MINUS_4_PI; x <= FIXED_PT_4_PI; x += x_step)
				sin_fixed(x);
			break;
		}
	} else {
		switch (function) {
		case (0):
			printf("%36s,%36s\n","x","sin_taylor");
			for (x = FIXED_PT_MINUS_4_PI; x <= FIXED_PT_4_PI; x += x_step)
				printf("%36.32lf,%36.32lf\n",
						(double)x / ((fixed_pt)1 << 32),
						(double)sin_fixed(x)/ ((fixed_pt)1 << 32));
			break;
		}
	}

	return 0;
}


