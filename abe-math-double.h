/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math-double.h
 */

#ifndef ABE_MATH_DOUBLE_H
#define ABE_MATH_DOUBLE_H
/* compute rectangle area */
double area_rect(double delta_x, double y);

/* compute trapezoid area */
double area_trap(double delta_x, double y1, double y2);

/* approximate a sin value using taylor series */
double sin_taylor(double x);

/* compute the value of a polynomial (lowest degree coefficient first) evaluated at x */
double poly_eval(const double *coefs, int power, double x);
#endif
