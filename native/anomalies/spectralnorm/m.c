#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifndef TWO
#define TWO 2
#endif
static long two = 2;
__attribute__((noinline)) void av(long n, const double *v, double *out, long d2) {
  for (long i = 0; i < n; i++) { double s = 0;
    for (long j = 0; j < n; j++) { long k = i + j; s += 1.0 / (double)((k * (k + 1)) / DIVISOR + (i + 1)) * v[j]; }
    out[i] = s; }
}
int main(int c, char **a) {
  long n = 2000, d2 = two; double *u = malloc(n * 8), *v = malloc(n * 8);
  for (long i = 0; i < n; i++) u[i] = 1;
  double best = 1e9;
  for (int r = 0; r < 7; r++) { struct timespec t0, t1; clock_gettime(CLOCK_MONOTONIC, &t0);
    for (int k = 0; k < 20; k++) { av(n, u, v, d2); av(n, v, u, d2); }
    clock_gettime(CLOCK_MONOTONIC, &t1); double ms = (t1.tv_sec - t0.tv_sec) * 1e3 + (t1.tv_nsec - t0.tv_nsec) / 1e6; if (ms < best) best = ms; }
  printf("%.1f ms  %g\n", best, u[0]);
}
