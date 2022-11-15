/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math.c
 */

/* integrate an array of long integers using rectangles */
long int a_int_rect(long int *x, long int *y, unsigned long int length)
{
	unsigned long int i;
	long int ret;

	if (length == 0)
		return 0;

	for (i = 1; i < length; i++)
		ret += (x[i] - x[i - 1]) * y[i - 1];

	return ret;

}

/* integrate an array of long integers using trapezoids */
long int a_int_trap(long int *x, long int *y, unsigned long int length)
{
	unsigned long int i;
	long int ret;

	if (length == 0)
		return 0;

	for (i = 1; i < length; i++)
		ret += (x[i] - x[i - 1]) * (y[i] + y[i - 1]) / 2;

	return ret;

}
/* integrate an array of floats using rectangles */
float a_fint_rect(float *x, float *y, unsigned long int length)
{
	unsigned long int i;
	float ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 1; i < length; i++)
		ret += (x[i] - x[i - 1]) * y[i - 1];

	return ret;
}

/* integrate an array of floats using trapezoids*/
float a_fint_trap(float *x, float *y, unsigned long int length)
{
	unsigned long int i;
	float ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 1; i < length; i++)
		ret += 0.5 * (x[i] - x[i - 1]) * (y[i] + y[i - 1]);

	return ret;
}

/* integrate an array of doubles using rectangles */
double a_lfint_rect(double *x, double *y, unsigned long int length)
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
double a_lfint_trap(double *x, double *y, unsigned long int length)
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
