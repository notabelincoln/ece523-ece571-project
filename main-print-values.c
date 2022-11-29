/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-print-values.c
 */

#include <stdio.h>
#include <math.h>
#include <stdint.h>

/* convert double to 5_11 */
int16_t double_to_fxd_5_11(double cmp_val);

/* convert double to 16_16 */
int32_t double_to_fxd_16_16(double cmp_val);

/* convert double to 32_32 */
int64_t double_to_fxd_32_32(double cmp_val);

int main(int argc, char **argv)
{
	printf("5.11:\n");
	printf("%5s %#06hx\n", "π", double_to_fxd_5_11(M_PI));
	printf("%5s %#06hx\n", "-π", double_to_fxd_5_11(-1 * M_PI));
	printf("%5s %#06hx\n", "2π", double_to_fxd_5_11(2 * M_PI));
	printf("%5s %#06hx\n", "-2π", double_to_fxd_5_11(-2 * M_PI));
	printf("%5s %#06hx\n", "π/2", double_to_fxd_5_11(M_PI / 2));
	printf("%5s %#06hx\n", "-π/2", double_to_fxd_5_11(M_PI / -2));

	printf("16.16:\n");
	printf("%5s %#010x\n", "π", double_to_fxd_16_16(M_PI));
	printf("%5s %#010x\n", "-π", double_to_fxd_16_16(-1 * M_PI));
	printf("%5s %#010x\n", "2π", double_to_fxd_16_16(2 * M_PI));
	printf("%5s %#010x\n", "-2π", double_to_fxd_16_16(-2 * M_PI));
	printf("%5s %#010x\n", "π/2", double_to_fxd_16_16(M_PI / 2));
	printf("%5s %#010x\n", "-π/2", double_to_fxd_16_16(M_PI / -2));
	
	printf("32.32:\n");
	printf("%5s %#018lx\n", "π", double_to_fxd_32_32(M_PI));
	printf("%5s %#018lx\n", "-π", double_to_fxd_32_32(-1 * M_PI));
	printf("%5s %#018lx\n", "2π", double_to_fxd_32_32(2 * M_PI));
	printf("%5s %#018lx\n", "-2π", double_to_fxd_32_32(-2 * M_PI));
	printf("%5s %#018lx\n", "π/2", double_to_fxd_32_32(M_PI / 2));
	printf("%5s %#018lx\n", "-π/2", double_to_fxd_32_32(M_PI / -2));
	
	return 0;
}

int16_t double_to_fxd_5_11(double cmp_val)
{
	int16_t tmp;
	int16_t ret;
	int16_t dumb;

	if (cmp_val >= 0.0) {
		ret = 0;
		dumb = (int16_t)(cmp_val * ((int16_t)1 << 11));

		for (tmp = (dumb - 10); tmp <= (dumb + 10); tmp++) {
			ret = (fabs(cmp_val - (double)(tmp) / ((int16_t)1 << 11)) > 
					fabs(cmp_val - (double)(ret) / ((int16_t)1 << 11))) ?
				ret : tmp;
		}

	} else {
		ret = -1 * double_to_fxd_5_11(-1 * cmp_val);
	}

	return ret;
}

int32_t double_to_fxd_16_16(double cmp_val)
{
	int32_t tmp;
	int32_t ret;
	int32_t dumb;

	if (cmp_val >= 0.0) {
		ret = 0;
		dumb = (int32_t)(cmp_val * ((int32_t)1 << 16));

		for (tmp = (dumb - 10); tmp <= (dumb + 10); tmp++) {
			ret = (fabs(cmp_val - (double)(tmp) / ((int32_t)1 << 16)) > 
					fabs(cmp_val - (double)(ret) / ((int32_t)1 << 16))) ?
				ret : tmp;
		}

	} else {
		ret = -1 * double_to_fxd_16_16(-1 * cmp_val);
	}

	return ret;
}

int64_t double_to_fxd_32_32(double cmp_val)
{
	int64_t tmp;
	int64_t ret;
	int64_t dumb;

	if (cmp_val >= 0.0) {
		ret = 0;
		dumb = (int64_t)(cmp_val * ((int64_t)1 << 32));

		for (tmp = (dumb - 10); tmp <= (dumb + 10); tmp++) {
			ret = (fabs(cmp_val - (double)(tmp) / ((int64_t)1 << 32)) > 
					fabs(cmp_val - (double)(ret) / ((int64_t)1 << 32))) ?
				ret : tmp;

		}

	} else {
		ret = -1 * double_to_fxd_32_32(-1 * cmp_val);
	}

	return ret;
}
