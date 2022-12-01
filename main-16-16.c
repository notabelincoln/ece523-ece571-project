/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-16-16.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "fixed-point-16-16.h"

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	fixed_pt x;

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

	if (display == 0) { /* run code without displaying results */
		switch (function) {
		case (0):
			for (x = FIXED_PT_MINUS_4_PI; x <= FIXED_PT_4_PI; x++)
				sin_fixed(x);
			break;
		}
	} else { /* run code and display results */
		switch (function) {
		case (0):
			printf("%20s,%20s\n","x","sin_taylor");
			for (x = FIXED_PT_MINUS_4_PI; x <= FIXED_PT_4_PI; x++)
				printf("%20.16lf,%20.16lf\n",
						fixed_to_double(x),
						fixed_to_double(sin_fixed(x)));
			break;
		}
	}

	return 0;
}


