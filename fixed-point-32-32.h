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
