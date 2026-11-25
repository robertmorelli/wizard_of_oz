// core::arch::wasm32's simd128 intrinsics, as used by the BG Rust ports, on x86_64
// SSE, so the same sources run natively. Semantics follow the wasm spec (swizzle
// indexes >= 16 give 0; demote zeroes the high lanes).
#![allow(non_camel_case_types, dead_code)]
use core::arch::x86_64::*;
use core::mem::transmute;

#[derive(Copy, Clone)]
#[repr(transparent)]
pub struct v128(__m128i);

macro_rules! pd { ($v:expr) => { _mm_castsi128_pd($v.0) }; }
macro_rules! ps { ($v:expr) => { _mm_castsi128_ps($v.0) }; }
macro_rules! fd { ($v:expr) => { v128(_mm_castpd_si128($v)) }; }
macro_rules! fs { ($v:expr) => { v128(_mm_castps_si128($v)) }; }

#[inline(always)] pub unsafe fn v128_load(p: *const v128) -> v128 { v128(_mm_loadu_si128(p as *const __m128i)) }
#[inline(always)] pub unsafe fn v128_store(p: *mut v128, a: v128) { _mm_storeu_si128(p as *mut __m128i, a.0) }
#[inline(always)] pub fn v128_and(a: v128, b: v128) -> v128 { unsafe { v128(_mm_and_si128(a.0, b.0)) } }
#[inline(always)] pub fn v128_or(a: v128, b: v128) -> v128 { unsafe { v128(_mm_or_si128(a.0, b.0)) } }

#[inline(always)] pub fn i8x16_splat(x: i8) -> v128 { unsafe { v128(_mm_set1_epi8(x)) } }
#[inline(always)] pub fn i8x16_add(a: v128, b: v128) -> v128 { unsafe { v128(_mm_add_epi8(a.0, b.0)) } }
#[inline(always)] pub fn i8x16_sub(a: v128, b: v128) -> v128 { unsafe { v128(_mm_sub_epi8(a.0, b.0)) } }
// pshufb zeroes a lane only when the index's top bit is set; saturating-add 0x70 sets it for 16..255.
#[inline(always)] pub fn i8x16_swizzle(a: v128, s: v128) -> v128 { unsafe { v128(_mm_shuffle_epi8(a.0, _mm_adds_epu8(s.0, _mm_set1_epi8(0x70)))) } }
#[inline(always)] pub fn u8x16_swizzle(a: v128, s: v128) -> v128 { i8x16_swizzle(a, s) }
#[inline(always)] pub fn u8x16_extract_lane<const N: usize>(a: v128) -> u8 { unsafe { transmute::<v128, [u8; 16]>(a)[N] } }

#[inline(always)] pub fn i32x4_splat(x: i32) -> v128 { unsafe { v128(_mm_set1_epi32(x)) } }
#[inline(always)] pub fn i32x4_sub(a: v128, b: v128) -> v128 { unsafe { v128(_mm_sub_epi32(a.0, b.0)) } }
#[inline(always)] pub fn i32x4_lt(a: v128, b: v128) -> v128 { unsafe { v128(_mm_cmplt_epi32(a.0, b.0)) } }
#[inline(always)] pub fn i32x4_extract_lane<const N: usize>(a: v128) -> i32 { unsafe { transmute::<v128, [i32; 4]>(a)[N] } }

#[inline(always)] pub fn i64x2_shuffle<const I0: usize, const I1: usize>(a: v128, b: v128) -> v128 {
    unsafe { let x: [u64; 2] = transmute(a); let y: [u64; 2] = transmute(b); let all = [x[0], x[1], y[0], y[1]]; transmute([all[I0], all[I1]]) }
}

#[inline(always)] pub fn f64x2_splat(x: f64) -> v128 { unsafe { fd!(_mm_set1_pd(x)) } }
#[inline(always)] pub fn f64x2_add(a: v128, b: v128) -> v128 { unsafe { fd!(_mm_add_pd(pd!(a), pd!(b))) } }
#[inline(always)] pub fn f64x2_sub(a: v128, b: v128) -> v128 { unsafe { fd!(_mm_sub_pd(pd!(a), pd!(b))) } }
#[inline(always)] pub fn f64x2_mul(a: v128, b: v128) -> v128 { unsafe { fd!(_mm_mul_pd(pd!(a), pd!(b))) } }
#[inline(always)] pub fn f64x2_div(a: v128, b: v128) -> v128 { unsafe { fd!(_mm_div_pd(pd!(a), pd!(b))) } }
#[inline(always)] pub fn f64x2_extract_lane<const N: usize>(a: v128) -> f64 { unsafe { transmute::<v128, [f64; 2]>(a)[N] } }
#[inline(always)] pub fn f64x2_promote_low_f32x4(a: v128) -> v128 { unsafe { fd!(_mm_cvtps_pd(ps!(a))) } }

#[inline(always)] pub fn f32x4_splat(x: f32) -> v128 { unsafe { fs!(_mm_set1_ps(x)) } }
#[inline(always)] pub fn f32x4_div(a: v128, b: v128) -> v128 { unsafe { fs!(_mm_div_ps(ps!(a), ps!(b))) } }
#[inline(always)] pub fn f32x4_sqrt(a: v128) -> v128 { unsafe { fs!(_mm_sqrt_ps(ps!(a))) } }
#[inline(always)] pub fn f32x4_demote_f64x2_zero(a: v128) -> v128 { unsafe { fs!(_mm_cvtpd_ps(pd!(a))) } }

#[inline(always)] pub const fn f64x2(a: f64, b: f64) -> v128 { unsafe { transmute([a, b]) } }
#[inline(always)] pub const fn i8x16(a0: i8, a1: i8, a2: i8, a3: i8, a4: i8, a5: i8, a6: i8, a7: i8, a8: i8, a9: i8, a10: i8, a11: i8, a12: i8, a13: i8, a14: i8, a15: i8) -> v128 {
    unsafe { transmute([a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]) }
}
