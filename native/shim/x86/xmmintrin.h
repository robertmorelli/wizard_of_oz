/* x86 intrinsics mapped to NEON through SIMDe, so the BG sources build on arm64 unchanged. */
#pragma once
#define SIMDE_ENABLE_NATIVE_ALIASES
#include <simde/x86/avx2.h>
#include <simde/x86/fma.h>
/* Emscripten (the wasm builds these results are checked against) makes rsqrt and rcp
   exact (1/sqrt, 1/x); NEON's estimates differ in the low bits and change checksums. */
#undef _mm_rsqrt_ps
#define _mm_rsqrt_ps(a) _mm_div_ps(_mm_set1_ps(1.0f), _mm_sqrt_ps(a))
#undef _mm_rcp_ps
#define _mm_rcp_ps(a) _mm_div_ps(_mm_set1_ps(1.0f), (a))
#undef _mm256_rsqrt_ps
#define _mm256_rsqrt_ps(a) _mm256_div_ps(_mm256_set1_ps(1.0f), _mm256_sqrt_ps(a))
/* SIMDe's set/setr aliases are fixed-arity macros, so a macro argument that expands to
   the whole list (fannkuchredux's _mm_setr_epi8(RAMP16)) fails; take them variadic. */
#undef _mm_setr_epi8
#define _mm_setr_epi8(...) simde_mm_setr_epi8(__VA_ARGS__)
#undef _mm_set_epi8
#define _mm_set_epi8(...) simde_mm_set_epi8(__VA_ARGS__)
#undef _mm_setr_epi16
#define _mm_setr_epi16(...) simde_mm_setr_epi16(__VA_ARGS__)
#undef _mm_set_epi16
#define _mm_set_epi16(...) simde_mm_set_epi16(__VA_ARGS__)
#undef _mm_setr_epi32
#define _mm_setr_epi32(...) simde_mm_setr_epi32(__VA_ARGS__)
#undef _mm_set_epi32
#define _mm_set_epi32(...) simde_mm_set_epi32(__VA_ARGS__)
