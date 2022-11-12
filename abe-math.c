/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math.c
 */

double a_integrate(double *x, double *y, unsigned long long int length)
{
	unsigned long long int i;
	double ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 0; i < length; i++)
		ret += x[i] * y[i];

	return ret;
}

double a_integrate_trapz(double *x, double *y, unsigned long long int length)
{
	unsigned long long int i;
	double ret;

	if (length == 0)
		return 0;

	ret = 0;

	for (i = 1; i < length; i++)
		ret += 0.5 * (x[i] - x[i - 1]) * (y[i] + y[i - 1]);

	return ret;
}
