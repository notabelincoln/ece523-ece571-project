/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * fixed-point-32-32.h
 */
#ifndef FIXED_POINT_32_32_H
#define FIXED_POINT_32_32_H

#include <stdint.h>

typedef int64_t fixed_pt;
typedef __int128 fixed_pt2;

#define FIXED_PT_PI ((fixed_pt)(0x00000003243f6a89))
#define FIXED_PT_MINUS_PI ((fixed_pt)(0xfffffffcdbc09577))
#define FIXED_PT_2_PI ((fixed_pt)(0x00000006487ed511))
#define FIXED_PT_MINUS_2_PI ((fixed_pt)(0xfffffff9b7812aef))
#define FIXED_PT_HALF_PI ((fixed_pt)(0x00000001921fb544))
#define FIXED_PT_MINUS_HALF_PI ((fixed_pt)(0xfffffffe6de04abc))
#define FIXED_PT_4_PI ((fixed_pt)(0x0000000c90fdaa22))
#define FIXED_PT_MINUS_4_PI ((fixed_pt)(0xfffffff36f0255de))

#define FIXED_PT_BIT (32)
#define FIXED_PT_1 ((fixed_pt)1 << FIXED_PT_BIT)

/* convert double precision floating point value to fixed-point value */
fixed_pt double_to_fixed(double x);

/* convert fixed-point value to double precision floating point value */
double fixed_to_double(fixed_pt x);

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

/* compute the value of a polynomial (lowest degree coefficient first) evaluated at x */
fixed_pt poly_fixed(const fixed_pt *coefs, int power, fixed_pt x);

/* compute simpsons method of a general function */
fixed_pt sim_fixed(fixed_pt (*f)(fixed_pt f_x), fixed_pt x_a, fixed_pt x_b);

/* compute rectangle area */
fixed_pt area_rect(fixed_pt delta_x, fixed_pt y);

/* compute trapezoid area */
fixed_pt area_trap(fixed_pt delta_x, fixed_pt y1, fixed_pt y2);
#endif
