/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * abe-math-int.c
 */

/* compute rectangle area */
long int area_rect(long int delta_x, long int y)
{
	return delta_x * y;
}

/* compute trapezoid area */
long int area_trap(long int delta_x, long int y1, long int y2)
{
	return (delta_x * (y1 / 2 + y2 / 2));
}

