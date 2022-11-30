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
			for (x = -(2 * M_PI); x <= (2 * M_PI); x += 0.000001)
				sin_taylor(x);
			break;
		}
	} else {
		switch (function) {
		case (0):
			printf("%11.7s,%10.7s\n","x","sin_taylor");
			for (x = -(2 * M_PI); x <= (2 * M_PI); x += 0.000001)
				printf("%11.7f,%10.7f\n",x,sin_taylor(x));
			break;
		}
	}

	return 0;
}


