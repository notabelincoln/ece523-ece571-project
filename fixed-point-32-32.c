/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-32-32.c
 */
#include "fixed-point-32-32.h"

#ifndef SIN_TAYLOR_N
#define SIN_TAYLOR_N 4 // number of terms to compute for sin(x)
#endif

/* convert double precision floating point value to fixed-point value */
fixed_pt double_to_fixed(double x)
{
	return (fixed_pt)(x * FIXED_PT_1);
}

/* convert fixed-point value to double precision floating point value */
double fixed_to_double(fixed_pt x)
{
	return (double)x / FIXED_PT_1;
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

	return (fixed_pt)(tmp >> FIXED_PT_BIT);
}

/* divide fixed-point number x1 by fixed-point number x2 */
fixed_pt div_fixed(fixed_pt x1, fixed_pt x2)
{
	fixed_pt2 tmp;

	tmp = ((fixed_pt2)(x1) << FIXED_PT_BIT) / (fixed_pt2)(x2);

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
	else if (x > (3 * FIXED_PT_HALF_PI))
		ret = sin_fixed(sub_fixed(x, 2 * FIXED_PT_PI));
	else if (x > FIXED_PT_HALF_PI)
		ret = -1 * sin_fixed(sub_fixed(x, FIXED_PT_PI));
	else
		ret = sin_fixed_taylor(x);

	return ret;
}

/* compute the value of a polynomial (lowest degree coefficient first) evaluated at x */
fixed_pt poly_fixed(const fixed_pt *coefs, int power, fixed_pt x)
{
	int i;
	int j;
	
	fixed_pt tmp;
	fixed_pt ret;

	ret = coefs[0];

	for (i = 1; i <= power; i++) {
		tmp = mul_fixed(x, coefs[i]);
		
		for (j = 1; j < i; j++)
			tmp = mul_fixed(tmp, x);

		ret = add_fixed(ret, tmp);
	}

	return ret;
}

/* compute simpsons method of a general function */
fixed_pt sim_fixed(fixed_pt (*f)(fixed_pt f_x), fixed_pt x_a, fixed_pt x_b)
{
	fixed_pt tmp1;
	fixed_pt tmp2;
	fixed_pt tmp3;
	fixed_pt ret;

	tmp1 = div_fixed_int(f(x_a), 6);
	tmp2 = div_fixed_int(f(x_b), 6);
	tmp1 = add_fixed(tmp1, tmp2);
	
	tmp2 = div_fixed_int(f(x_a), 2);
	tmp3 = div_fixed_int(f(x_b), 2);
	tmp2 = add_fixed(tmp2, tmp3);
	
	tmp2 = f(tmp2); 
	tmp2 = div_fixed_int(tmp2, 6); 
	tmp2 = mul_fixed(tmp2, 4 * FIXED_PT_1);
	
	tmp1 = add_fixed(tmp1, tmp2);

	tmp2 = sub_fixed(x_b, x_a);

	ret = mul_fixed(tmp1, tmp2);

	return ret;
}

/* compute rectangle area */
fixed_pt area_rect(fixed_pt delta_x, fixed_pt y)
{
	return mul_fixed(delta_x, y);
}

/* compute trapezoid area */
fixed_pt area_trap(fixed_pt delta_x, fixed_pt y1, fixed_pt y2)
{
	fixed_pt tmp;

	tmp = div_fixed_int(y1, 2);
	tmp = add_fixed(tmp, div_fixed_int(y2, 2));
	return mul_fixed(tmp, delta_x);
}

