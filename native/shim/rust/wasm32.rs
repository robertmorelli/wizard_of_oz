// core::arch::wasm32's simd128 intrinsics, as used by the BG Rust ports, on aarch64
// NEON, so the same sources run natively. Semantics follow the wasm spec (swizzle
// indexes >= 16 give 0, as tbl does; demote zeroes the high lanes).
#![allow(non_camel_case_types, dead_code)]
use core::arch::aarch64::*;
use core::mem::transmute;

#[derive(Copy, Clone)]
#[repr(transparent)]
pub struct v128(uint8x16_t);

macro_rules! cv { ($v:expr, $t:ty) => { transmute::<v128, $t>($v) }; }
macro_rules! vc { ($v:expr) => { transmute::<_, v128>($v) }; }

#[inline(always)] pub unsafe fn v128_load(p: *const v128) -> v128 { v128(vld1q_u8(p as *const u8)) }
#[inline(always)] pub unsafe fn v128_store(p: *mut v128, a: v128) { vst1q_u8(p as *mut u8, a.0) }
#[inline(always)] pub fn v128_and(a: v128, b: v128) -> v128 { unsafe { v128(vandq_u8(a.0, b.0)) } }
#[inline(always)] pub fn v128_or(a: v128, b: v128) -> v128 { unsafe { v128(vorrq_u8(a.0, b.0)) } }

#[inline(always)] pub fn i8x16_splat(x: i8) -> v128 { unsafe { vc!(vdupq_n_s8(x)) } }
#[inline(always)] pub fn i8x16_add(a: v128, b: v128) -> v128 { unsafe { vc!(vaddq_s8(cv!(a, int8x16_t), cv!(b, int8x16_t))) } }
#[inline(always)] pub fn i8x16_sub(a: v128, b: v128) -> v128 { unsafe { vc!(vsubq_s8(cv!(a, int8x16_t), cv!(b, int8x16_t))) } }
#[inline(always)] pub fn i8x16_swizzle(a: v128, s: v128) -> v128 { unsafe { v128(vqtbl1q_u8(a.0, s.0)) } }
#[inline(always)] pub fn u8x16_swizzle(a: v128, s: v128) -> v128 { i8x16_swizzle(a, s) }
#[inline(always)] pub fn u8x16_extract_lane<const N: usize>(a: v128) -> u8 { unsafe { cv!(a, [u8; 16])[N] } }

#[inline(always)] pub fn i32x4_splat(x: i32) -> v128 { unsafe { vc!(vdupq_n_s32(x)) } }
#[inline(always)] pub fn i32x4_sub(a: v128, b: v128) -> v128 { unsafe { vc!(vsubq_s32(cv!(a, int32x4_t), cv!(b, int32x4_t))) } }
#[inline(always)] pub fn i32x4_lt(a: v128, b: v128) -> v128 { unsafe { vc!(vcltq_s32(cv!(a, int32x4_t), cv!(b, int32x4_t))) } }
#[inline(always)] pub fn i32x4_extract_lane<const N: usize>(a: v128) -> i32 { unsafe { cv!(a, [i32; 4])[N] } }

#[inline(always)] pub fn i64x2_shuffle<const I0: usize, const I1: usize>(a: v128, b: v128) -> v128 {
    unsafe { let x = cv!(a, [u64; 2]); let y = cv!(b, [u64; 2]); let all = [x[0], x[1], y[0], y[1]]; vc!([all[I0], all[I1]]) }
}

#[inline(always)] pub fn f64x2_splat(x: f64) -> v128 { unsafe { vc!(vdupq_n_f64(x)) } }
#[inline(always)] pub fn f64x2_add(a: v128, b: v128) -> v128 { unsafe { vc!(vaddq_f64(cv!(a, float64x2_t), cv!(b, float64x2_t))) } }
#[inline(always)] pub fn f64x2_sub(a: v128, b: v128) -> v128 { unsafe { vc!(vsubq_f64(cv!(a, float64x2_t), cv!(b, float64x2_t))) } }
#[inline(always)] pub fn f64x2_mul(a: v128, b: v128) -> v128 { unsafe { vc!(vmulq_f64(cv!(a, float64x2_t), cv!(b, float64x2_t))) } }
#[inline(always)] pub fn f64x2_div(a: v128, b: v128) -> v128 { unsafe { vc!(vdivq_f64(cv!(a, float64x2_t), cv!(b, float64x2_t))) } }
#[inline(always)] pub fn f64x2_extract_lane<const N: usize>(a: v128) -> f64 { unsafe { cv!(a, [f64; 2])[N] } }
#[inline(always)] pub fn f64x2_promote_low_f32x4(a: v128) -> v128 { unsafe { vc!(vcvt_f64_f32(vget_low_f32(cv!(a, float32x4_t)))) } }

#[inline(always)] pub fn f32x4_splat(x: f32) -> v128 { unsafe { vc!(vdupq_n_f32(x)) } }
#[inline(always)] pub fn f32x4_div(a: v128, b: v128) -> v128 { unsafe { vc!(vdivq_f32(cv!(a, float32x4_t), cv!(b, float32x4_t))) } }
#[inline(always)] pub fn f32x4_sqrt(a: v128) -> v128 { unsafe { vc!(vsqrtq_f32(cv!(a, float32x4_t))) } }
#[inline(always)] pub fn f32x4_demote_f64x2_zero(a: v128) -> v128 { unsafe { vc!(vcombine_f32(vcvt_f32_f64(cv!(a, float64x2_t)), vdup_n_f32(0.0))) } }

#[inline(always)] pub const fn f64x2(a: f64, b: f64) -> v128 { unsafe { transmute([a, b]) } }
#[inline(always)] pub const fn i8x16(a0: i8, a1: i8, a2: i8, a3: i8, a4: i8, a5: i8, a6: i8, a7: i8, a8: i8, a9: i8, a10: i8, a11: i8, a12: i8, a13: i8, a14: i8, a15: i8) -> v128 {
    unsafe { transmute([a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]) }
}
