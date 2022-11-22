/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math-double.c
 */

#ifndef SIN_TAYLOR_N
#define SIN_TAYLOR_N 4
#endif

#include <math.h>
/* compute rectangle area */
double area_rect(double delta_x, double y)
{
	return delta_x * y;
}

/* compute trapezoid area */
double area_trap(double delta_x, double y1, double y2)
{
	return (delta_x * (y1 + y2) / 2);
}

/* approximate a sin value using taylor series */
double sin_taylor(double x)
{
	if (x > M_PI / 2)
		return -1 * a_sin_taylor(x - (M_PI));
	else if (x < M_PI / -2)
		return a_sin_taylor(x + 2 * M_PI);
	int i;
	double ret;
	double tmp;

	ret = x;
	tmp = x;

	for (i = 1; i < SIN_TAYLOR_N; i++) {
		tmp = tmp * x * x / (-2.0 * i * (2 * i + 1));
		ret += tmp;
	}

	return ret;
}

