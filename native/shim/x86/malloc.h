// glibc's <malloc.h>; also _mm_malloc/_mm_free, which x86 compilers provide.
#pragma once
#include <stdlib.h>
static inline void *_mm_malloc(size_t n, size_t a) { void *p = 0; return posix_memalign(&p, a < sizeof(void *) ? sizeof(void *) : a, n) ? 0 : p; }
static inline void _mm_free(void *p) { free(p); }
