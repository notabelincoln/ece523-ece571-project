/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-16-16.c
 */
#include "fixed-point-16-16.h"

#ifndef SIN_TAYLOR_N
#define SIN_TAYLOR_N 4 // number of terms to compute for sin(x)
#endif

/* convert double precision floating point value to fixed-point value */
fixed_pt double_to_fixed(double x)
{
	return (fixed_pt)(x * ((fixed_pt)1 << 16));
}

/* add two fixed-point numbers */
fixed_pt add_fixed(fixed_pt x1, fixed_pt x2)
{
	return (x1 + x2);
}

/* subtract fixed-point number x2 from fixed point-number x1 */
fixed_pt sub_fixed(fixed_pt x1, fixed_pt x2)
{
	return (x1 - x2);
}

/* multiply two-fixed point numbers together */
fixed_pt mul_fixed(fixed_pt x1, fixed_pt x2)
{
	fixed_pt2 tmp;

	tmp = (fixed_pt2)x1 * (fixed_pt2)x2;

	return (fixed_pt)(tmp >> 16);
}

/* divide fixed-point number x1 by fixed-point number x2 */
fixed_pt div_fixed(fixed_pt x1, fixed_pt x2)
{
	fixed_pt2 tmp;

	tmp = ((fixed_pt2)(x1) << 16) / (fixed_pt2)(x2);

	return (fixed_pt)tmp;
}

/* divide fixed-point number by int */
fixed_pt div_fixed_int(fixed_pt x, int x_int)
{
	return x / x_int;
}

/* calculate taylor series for sin(x) up to nth term */
fixed_pt sin_fixed_taylor(fixed_pt x)
{
	int i;
	fixed_pt tmp;
	fixed_pt sum;

	tmp = x;
	sum = x;
	
	for (i = 1; i < SIN_TAYLOR_N; i++) {
		tmp = mul_fixed(x, tmp);
		tmp = div_fixed_int(tmp, -2 * i);
		tmp = mul_fixed(tmp, x);
		tmp = div_fixed_int(tmp, 2 * i + 1);
		sum = add_fixed(sum, tmp);	
	}

	return sum;
}

/* calculated approximate value for sin(x) */
fixed_pt sin_fixed(fixed_pt x)
{
	fixed_pt ret;

	if (x < FIXED_PT_MINUS_HALF_PI)
		ret = sin_fixed(add_fixed(x, FIXED_PT_2_PI));
	else if (x > (3 * (FIXED_PT_HALF_PI)))
		ret = sin_fixed(sub_fixed(x, 2 * FIXED_PT_PI));
	else if (x > FIXED_PT_HALF_PI)
		ret = -1 * sin_fixed(sub_fixed(x, FIXED_PT_PI));
	else
		ret = sin_fixed_taylor(x);

	return ret;
}

