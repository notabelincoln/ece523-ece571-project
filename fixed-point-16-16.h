/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-16-16.h
 */
#ifndef FIXED_POINT_16_16_H
#define FIXED_POINT_16_16_H

#include <stdint.h>

typedef int32_t fixed_pt;
typedef int64_t fixed_pt2;

#define FIXED_PT_PI ((fixed_pt)(0x0003243f))
#define FIXED_PT_MINUS_PI ((fixed_pt)(0xfffcdbc1))
#define FIXED_PT_2_PI ((fixed_pt)(0x0006487f))
#define FIXED_PT_MINUS_2_PI ((fixed_pt)(0xfff9b781))
#define FIXED_PT_HALF_PI ((fixed_pt)(0x00019220))
#define FIXED_PT_MINUS_HALF_PI ((fixed_pt)(0xfffe6de0))

/* convert double precision floating point value to fixed-point value */
fixed_pt double_to_fixed(double x);

/* add two fixed-point numbers */
fixed_pt add_fixed(fixed_pt x1, fixed_pt x2);

/* subtract fixed-point number x2 from fixed point-number x1 */
fixed_pt sub_fixed(fixed_pt x1, fixed_pt x2);

/* multiply two-fixed point numbers together */
fixed_pt mul_fixed(fixed_pt x1, fixed_pt x2);

/* divide fixed-point number x1 by fixed-point number x2 */
fixed_pt div_fixed(fixed_pt x1, fixed_pt x2);

/* divide fixed-point number by int */
fixed_pt div_fixed_int(fixed_pt x, int x_int);

/* calculate taylor series for sin(x) up to nth term */
fixed_pt sin_fixed_taylor(fixed_pt x);

/* calculated approximate value for sin(x) */
fixed_pt sin_fixed(fixed_pt x);
#endif
