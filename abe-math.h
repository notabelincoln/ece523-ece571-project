/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math.h
 */

#ifndef ABE_MATH_H
#define ABE_MATH_H
/* integrate an array of long integers using rectangles */
long int a_int_rect(long int *x, long int *y, unsigned long int length);

/* integrate an array of long integers using trapezoids */
long int a_int_trap(long int *x, long int *y, unsigned long int length);

/* integrate an array of floats using rectangles */
float a_fint_rect(float *x, float *y, unsigned long int length);

/* integrate an array of floats using trapezoids*/
float a_fint_trap(float *x, float *y, unsigned long int length);

/* integrate an array of doubles using rectangles */
double a_lfint_rect(double *x, double *y, unsigned long int length);

/* integrate an array of doubles using trapezoids*/
double a_lfint_trap(double *x, double *y, unsigned long int length);

/* approximate a sin value using taylor series */
double sin_taylor(double x);
#endif
