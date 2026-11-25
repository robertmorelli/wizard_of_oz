// Times a port's bench(n) like the d8 driver: setup once (untimed), one run for the
// result, warmups, then timed samples; prints one JSON line.
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
uint32_t bench(int n);
#ifdef HAS_SETUP
void setup(int n);
#endif
static int cmp(const void *a, const void *b) { double x = *(const double *)a, y = *(const double *)b; return x < y ? -1 : x > y; }
static double now(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return t.tv_sec * 1e3 + t.tv_nsec / 1e6; }
int main(int argc, char **argv) {
  if (argc < 4) { fprintf(stderr, "usage: n samples warmups [setup]\n"); return 2; }
  int n = atoi(argv[1]), samples = atoi(argv[2]), warmups = atoi(argv[3]);
#ifdef HAS_SETUP
  setup(argc > 4 ? atoi(argv[4]) : n);
#endif
  uint32_t result = bench(n);
  for (int i = 0; i < warmups; i++) bench(n);
  double *t = malloc(sizeof(double) * samples);
  for (int i = 0; i < samples; i++) {
    double s = now(); uint32_t r = bench(n); t[i] = now() - s;
    if (r != result) { printf("ERROR bench returned %u after %u\n", r, result); return 3; }
  }
  double *st = malloc(sizeof(double) * samples);
  for (int i = 0; i < samples; i++) st[i] = t[i];
  qsort(st, samples, sizeof(double), cmp);
  double med = samples % 2 ? st[samples / 2] : (st[samples / 2 - 1] + st[samples / 2]) / 2;
  printf("RESULT {\"result\":\"%u\",\"median\":%.4f,\"best\":%.4f,\"times\":[", result, med, st[0]);
  for (int i = 0; i < samples; i++) printf("%s%.4f", i ? "," : "", t[i]);
  printf("]}\n");
  return 0;
}
