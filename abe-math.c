/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math.c
 */

long int a_int(long int x, long int y, unsigned long int length)
{
	unsigned long int i;

}

/* integrate an array of doubles using rectangles */
double a_lf_int_rect(double *x, double *y, unsigned long int length)
{
	unsigned long int i;
	double ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 1; i < length; i++)
		ret += (x[i] - x[i - 1]) * y[i - 1];

	return ret;
}

/* integrate an array of doubles using trapezoids*/
double a_lf_int_trap(double *x, double *y, unsigned long int length)
{
	unsigned long int i;
	double ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 1; i < length; i++)
		ret += 0.5 * (x[i] - x[i - 1]) * (y[i] + y[i - 1]);

	return ret;
}
