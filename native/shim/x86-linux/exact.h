/* Real x86 intrinsics, except rsqrt/rcp made exact (1/sqrt, 1/x) as Emscripten does,
   so checksums match the wasm runs. Included after each real header. */
#if defined(__XMMINTRIN_H) && !defined(_mm_rsqrt_ps)
#define _mm_rsqrt_ps(a) _mm_div_ps(_mm_set1_ps(1.0f), _mm_sqrt_ps(a))
#define _mm_rcp_ps(a) _mm_div_ps(_mm_set1_ps(1.0f), (a))
#endif
#if defined(__AVXINTRIN_H) && !defined(_mm256_rsqrt_ps)
#define _mm256_rsqrt_ps(a) _mm256_div_ps(_mm256_set1_ps(1.0f), _mm256_sqrt_ps(a))
#endif
