/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-5-11.h
 */
#ifndef FIXED_POINT_5_11_H
#define FIXED_POINT_5_11_H

#include <stdint.h>

#define FXPT0511_PI ((int16_t)(0x1922))
#define FXPT0511_MINUS_PI ((int16_t)(0xe6de))
#define FXPT0511_2_PI ((int16_t)(0x3244))
#define FXPT0511_MINUS_2_PI ((int16_t)(0xcdbc))
#define FXPT0511_HALF_PI ((int16_t)(0x0c91))
#define FXPT0511_MINUS_HALF_PI ((int16_t)(0xf36f))

/* convert double precision floating point value to fixed-point value */
int16_t double_to_fixed(double x);

/* add two fixed-point numbers */
int16_t add_fixed(int16_t x1, int16_t x2);

/* subtract fixed-point number x2 from fixed point-number x1 */
int16_t sub_fixed(int16_t x1, int16_t x2);

/* multiply two-fixed point numbers together */
int16_t mul_fixed(int16_t x1, int16_t x2);

/* divide fixed-point number x1 by fixed-point number x2 */
int16_t div_fixed(int16_t x1, int16_t x2);

/* divide fixed-point number by int */
int16_t div_fixed_int(int16_t x, int x_int);

/* calculate taylor series for sin(x) up to 7th power */
//int16_t sin_fixed_taylor(int16_t x);

/* calculated approximate value for sin(x) */
int16_t sin_fixed(int16_t x);

/* calculate approximate value for cos(x) */
int16_t cos_fixed(int16_t x);

/* calculate approximate value for x ^ 1/2 using Newton-Raphson */
int16_t sqrt_fixed(int16_t x);

/* calculate approximate value for arcsin(x) using Newton-Raphson */
int16_t asin_fixed(int16_t x);

/* calculate approximate value for arccos(x) using Newton-Raphson */
int16_t acos_fixed(int16_t x);
#endif
