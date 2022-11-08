/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-5-11.c
 */
#include "fixed-point-5-11.h"

#ifndef SIN_FIXED_N
#define SIN_FIXED_N 4 // number of terms to compute for sin(x)
#endif

/* convert double precision floating point value to fixed-point value */
int16_t double_to_fixed(double x)
{
	return (int16_t)(x * 2048);
}

/* add two fixed-point numbers */
int16_t add_fixed(int16_t x1, int16_t x2)
{
	return (x1 + x2);
}

/* subtract fixed-point number x2 from fixed point-number x1 */
int16_t sub_fixed(int16_t x1, int16_t x2)
{
	return (x1 - x2);
}

/* multiply two-fixed point numbers together */
int16_t mul_fixed(int16_t x1, int16_t x2)
{
	int32_t tmp;

	tmp = (int32_t)x1 * (int32_t)x2;

	return (int16_t)(tmp >> 11);
}

/* divide fixed-point number x1 by fixed-point number x2 */
int16_t div_fixed(int16_t x1, int16_t x2)
{
	int32_t tmp;

	tmp = ((int32_t)(x1) << 11) / (int32_t)(x2);

	return (int16_t)tmp;
}

/* divide fixed-point number by int */
int16_t div_fixed_int(int16_t x, int x_int)
{
	return x / x_int;
}

/* calculate taylor series for sin(x) up to 7th power */
int16_t sin_fixed_taylor(int16_t x)
{
	int i;
	int16_t tmp;
	int16_t sum;

	tmp = x;
	sum = x;
	
	for (i = 1; i < SIN_FIXED_N; i++) {
		tmp = mul_fixed(x, tmp);
		tmp = div_fixed_int(tmp, -2 * i);
		tmp = mul_fixed(tmp, x);
		tmp = div_fixed_int(tmp, 2 * i + 1);
		sum = add_fixed(sum, tmp);	
	}

	return sum;
}

/* calculated approximate value for sin(x) */
int16_t sin_fixed(int16_t x)
{
	int16_t ret;

	if (x < FXPT0511_MINUS_HALF_PI)
		ret = sin_fixed(add_fixed(x, FXPT0511_2_PI));
	else if (x > (3 * (FXPT0511_HALF_PI)))
		ret = sin_fixed(sub_fixed(x, 2 * FXPT0511_PI));
	else if (x > FXPT0511_HALF_PI)
		ret = -1 * sin_fixed(sub_fixed(x, FXPT0511_PI));
	else
		ret = sin_fixed_taylor(x);

	return ret;
}

/* calculate approximate value for cos(x) */
int16_t cos_fixed(int16_t x)
{
	return sin_fixed(add_fixed(x, FXPT0511_HALF_PI));
}

/* calculate approximate value for x ^ 1/2 using Newton-Raphson */
int16_t sqrt_fixed(int16_t x)
{
	if (x <= 0)
		return 0;

	int i;
	
	int16_t ret;
	int16_t tmp;

	ret = x;

	for (i = 0; i < 5; i++) {
		tmp = div_fixed(x, ret);
		ret = ret - sub_fixed(ret, tmp) / 2;
	}

	return ret;
}

/* calculate approximate value for arcsin(x) using Newton-Raphson */
int16_t asin_fixed(int16_t x)
{
	if (x == -(1 << 11))
		return FXPT0511_MINUS_HALF_PI;
	else if (x == 0)
		return 0;
	else if (x == (1 << 11))
		return FXPT0511_HALF_PI; 

	int i;
	
	int16_t ret;
	int16_t tmp;

	ret = x;

	for (i = 0; i < 5; i++) {
		tmp = sin_fixed(ret) - x;
		ret = ret - div_fixed(tmp, cos_fixed(ret));
	}

	return ret;
}

/* calculate approximate value for arccos(x) using Newton-Raphson */
int16_t acos_fixed(int16_t x)
{
	if (x == -2048)
		return FXPT0511_PI;
	else if (x == 0)
		return FXPT0511_HALF_PI; 
	else if (x == 2048)
		return 0;

	int16_t ret;

	ret = sub_fixed(FXPT0511_HALF_PI, asin_fixed(x));

	return ret;
}

