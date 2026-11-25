; ModuleID = 'programs/binarytrees/cpp/binarytrees.cpp'
source_filename = "programs/binarytrees/cpp/binarytrees.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx27.0.0"

%"struct.std::nothrow_t" = type { i8 }
%"class.boost::object_pool" = type { %"class.boost::pool" }
%"class.boost::pool" = type { %"class.boost::simple_segregated_storage", %"class.boost::details::PODptr", i64, i64, i64, i64 }
%"class.boost::simple_segregated_storage" = type { ptr }
%"class.boost::details::PODptr" = type { ptr, i64 }

@.str = private unnamed_addr constant [37 x i8] c"stretch tree of depth %d\09 check: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"%d\09 trees of depth %d\09 check: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"long lived tree of depth %d\09 check: %d\0A\00", align 1
@__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv = private unnamed_addr constant [11 x i8] c"alloc_size\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"pool.hpp\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"s >= min_alloc_size\00", align 1
@_ZSt7nothrow = external global %"struct.std::nothrow_t", align 1

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %0, ptr noundef nonnull align 8 dereferenceable(56) %1) local_unnamed_addr #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = icmp eq i32 %0, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = tail call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructEv(ptr noundef nonnull %1) #12
  br label %8

8:                                                ; preds = %10, %6
  %9 = phi ptr [ %7, %6 ], [ %14, %10 ]
  ret ptr %9

10:                                               ; preds = %2
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #13
  %11 = add nsw i32 %0, -1
  %12 = tail call ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %11, ptr noundef nonnull align 8 dereferenceable(56) %1) #12
  store ptr %12, ptr %3, align 8, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #13
  %13 = tail call ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %11, ptr noundef nonnull align 8 dereferenceable(56) %1) #12
  store ptr %13, ptr %4, align 8, !tbaa !6
  %14 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructIPS1_S5_EES5_RKT_RKT0_(ptr noundef nonnull %1, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) #12
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #13
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #13
  br label %8
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructEv(ptr noundef %0) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE14ordered_mallocEv(ptr noundef nonnull %0) #12
  %3 = icmp eq ptr %2, null
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %2, i8 0, i64 16, i1 false)
  br label %5

5:                                                ; preds = %4, %1
  ret ptr %2
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructIPS1_S5_EES5_RKT_RKT0_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %4 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE14ordered_mallocEv(ptr noundef nonnull %0) #12
  %5 = icmp eq ptr %4, null
  br i1 %5, label %10, label %6

6:                                                ; preds = %3
  %7 = load ptr, ptr %1, align 8, !tbaa !6
  %8 = load ptr, ptr %2, align 8, !tbaa !6
  store ptr %7, ptr %4, align 8, !tbaa !11
  %9 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store ptr %8, ptr %9, align 8, !tbaa !13
  br label %10

10:                                               ; preds = %6, %3
  ret ptr %4
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define i32 @_Z14make_iterationiiib(i32 noundef %0, i32 noundef %1, i32 noundef %2, i1 noundef zeroext %3) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %5 = alloca %"class.boost::object_pool", align 8
  br i1 %3, label %6, label %21

6:                                                ; preds = %4
  %7 = sub i32 %1, %0
  %8 = add i32 %7, 1
  %9 = sdiv i32 %8, 16
  br label %10

10:                                               ; preds = %6, %14
  %11 = phi i32 [ %20, %14 ], [ 0, %6 ]
  %12 = phi i32 [ %19, %14 ], [ 0, %6 ]
  %13 = icmp eq i32 %11, 16
  br i1 %13, label %39, label %14

14:                                               ; preds = %10
  %15 = mul nsw i32 %11, %9
  %16 = add nsw i32 %15, %0
  %17 = add nsw i32 %15, %9
  %18 = tail call i32 @_Z14make_iterationiiib(i32 noundef %16, i32 noundef %17, i32 noundef %2, i1 noundef zeroext false) #12
  %19 = add nsw i32 %18, %12
  %20 = add nuw nsw i32 %11, 1
  br label %10, !llvm.loop !14

21:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %5) #13
  %22 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEC2Emm(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 0) #12
  br label %23

23:                                               ; preds = %33, %21
  %24 = phi i32 [ %0, %21 ], [ %35, %33 ]
  %25 = phi i32 [ 0, %21 ], [ %34, %33 ]
  %26 = icmp sgt i32 %24, %1
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %5) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %5) #13
  br label %39

29:                                               ; preds = %23
  %30 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %2, ptr noundef nonnull align 8 dereferenceable(56) %5) #12
          to label %31 unwind label %36

31:                                               ; preds = %29
  %32 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %30) #12
          to label %33 unwind label %36

33:                                               ; preds = %31
  %34 = add nsw i32 %32, %25
  %35 = add nsw i32 %24, 1
  br label %23, !llvm.loop !16

36:                                               ; preds = %31, %29
  %37 = landingpad { ptr, i32 }
          cleanup
  %38 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %5) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %5) #13
  resume { ptr, i32 } %37

39:                                               ; preds = %10, %27
  %40 = phi i32 [ %25, %27 ], [ %12, %10 ]
  ret i32 %40
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr i32 @_ZNK4Node5checkEv(ptr noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %7, %1
  %3 = phi i32 [ 0, %1 ], [ %12, %7 ]
  %4 = phi ptr [ %0, %1 ], [ %10, %7 ]
  %5 = load ptr, ptr %4, align 8, !tbaa !11
  %6 = icmp eq ptr %5, null
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = tail call i32 @_ZNK4Node5checkEv(ptr noundef nonnull %5) #12
  %9 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %10 = load ptr, ptr %9, align 8, !tbaa !13
  %11 = add i32 %3, 1
  %12 = add i32 %11, %8
  br label %2

13:                                               ; preds = %2
  %14 = add nsw i32 %3, 1
  ret i32 %14
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define i32 @bench(i32 noundef %0) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %2 = alloca [128 x i8], align 1
  %3 = alloca %"class.boost::object_pool", align 8
  %4 = alloca %"class.boost::object_pool", align 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %2) #13
  %5 = tail call i32 @llvm.smax.i32(i32 %0, i32 6)
  %6 = add nuw nsw i32 %5, 1
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %3) #13
  %7 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEC2Emm(ptr noundef nonnull %3, i64 noundef 32, i64 noundef 0) #12
  %8 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %6, ptr noundef nonnull align 8 dereferenceable(56) %3) #12
          to label %9 unwind label %23

9:                                                ; preds = %1
  %10 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %8) #12
          to label %11 unwind label %23

11:                                               ; preds = %9
  %12 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str, i32 noundef %6, i32 noundef %10) #14
  %13 = call fastcc i32 @_ZL3fnvjPKci(i32 noundef -2128831035, ptr noundef %2, i32 noundef %12) #12
  %14 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %3) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %3) #13
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #13
  %15 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEC2Emm(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 0) #12
  %16 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %5, ptr noundef nonnull align 8 dereferenceable(56) %4) #12
          to label %17 unwind label %26

17:                                               ; preds = %11, %32
  %18 = phi i32 [ %35, %32 ], [ 4, %11 ]
  %19 = phi i32 [ %34, %32 ], [ %13, %11 ]
  %20 = icmp samesign ugt i32 %18, %5
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %16) #12
          to label %38 unwind label %26

23:                                               ; preds = %9, %1
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %3) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %3) #13
  br label %45

26:                                               ; preds = %21, %11
  %27 = landingpad { ptr, i32 }
          cleanup
  br label %42

28:                                               ; preds = %17
  %29 = sub nuw nsw i32 %5, %18
  %30 = shl nuw i32 16, %29
  %31 = invoke i32 @_Z14make_iterationiiib(i32 noundef 1, i32 noundef %30, i32 noundef %18, i1 noundef zeroext true) #12
          to label %32 unwind label %36

32:                                               ; preds = %28
  %33 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str.1, i32 noundef %30, i32 noundef %18, i32 noundef %31) #14
  %34 = call fastcc i32 @_ZL3fnvjPKci(i32 noundef %19, ptr noundef %2, i32 noundef %33) #12
  %35 = add nuw nsw i32 %18, 2
  br label %17, !llvm.loop !17

36:                                               ; preds = %28
  %37 = landingpad { ptr, i32 }
          cleanup
  br label %42

38:                                               ; preds = %21
  %39 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str.2, i32 noundef %5, i32 noundef %22) #14
  %40 = call fastcc i32 @_ZL3fnvjPKci(i32 noundef %19, ptr noundef %2, i32 noundef %39) #12
  %41 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %4) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #13
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %2) #13
  ret i32 %40

42:                                               ; preds = %36, %26
  %43 = phi { ptr, i32 } [ %37, %36 ], [ %27, %26 ]
  %44 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %4) #14
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #13
  br label %45

45:                                               ; preds = %42, %23
  %46 = phi { ptr, i32 } [ %43, %42 ], [ %24, %23 ]
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %2) #13
  resume { ptr, i32 } %46
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize ssp willreturn memory(argmem: read) uwtable(sync)
define internal fastcc i32 @_ZL3fnvjPKci(i32 noundef %0, ptr noundef nonnull readonly captures(none) %1, i32 noundef %2) unnamed_addr #2 {
  %4 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %5 = zext nneg i32 %4 to i64
  br label %6

6:                                                ; preds = %11, %3
  %7 = phi i64 [ %17, %11 ], [ 0, %3 ]
  %8 = phi i32 [ %16, %11 ], [ %0, %3 ]
  %9 = icmp eq i64 %7, %5
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  ret i32 %8

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 %7
  %13 = load i8, ptr %12, align 1, !tbaa !18
  %14 = zext i8 %13 to i32
  %15 = xor i32 %8, %14
  %16 = mul i32 %15, 16777619
  %17 = add nuw nsw i64 %7, 1
  br label %6, !llvm.loop !19
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @snprintf(ptr noalias noundef writeonly captures(none), i64 noundef, ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

; Function Attrs: minsize noinline noreturn nounwind optsize ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #4 {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #13
  tail call void @_ZSt9terminatev() #15
  unreachable
}

; Function Attrs: cold nofree noreturn
declare void @_ZSt9terminatev() local_unnamed_addr #5

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE14ordered_mallocEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = load ptr, ptr %0, align 8, !tbaa !20
  %3 = icmp eq ptr %2, null
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = load ptr, ptr %2, align 8, !tbaa !22
  store ptr %5, ptr %0, align 8, !tbaa !20
  br label %8

6:                                                ; preds = %1
  %7 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv(ptr noundef nonnull %0) #12
  br label %8

8:                                                ; preds = %6, %4
  %9 = phi ptr [ %7, %6 ], [ %2, %4 ]
  ret ptr %9
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv(ptr noundef %0) #12
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %4 = load i64, ptr %3, align 8, !tbaa !23
  %5 = mul i64 %4, %2
  %6 = add i64 %5, 16
  %7 = tail call ptr @_ZN5boost33default_user_allocator_new_delete6mallocEm(i64 noundef %6) #12
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %20

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !tbaa !23
  %11 = icmp ugt i64 %10, 4
  br i1 %11, label %12, label %78

12:                                               ; preds = %9
  %13 = lshr i64 %10, 1
  store i64 %13, ptr %3, align 8, !tbaa !23
  %14 = tail call i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv(ptr noundef nonnull %0) #12
  %15 = load i64, ptr %3, align 8, !tbaa !23
  %16 = mul i64 %15, %14
  %17 = add i64 %16, 16
  %18 = tail call ptr @_ZN5boost33default_user_allocator_new_delete6mallocEm(i64 noundef %17) #12
  %19 = icmp eq ptr %18, null
  br i1 %19, label %78, label %20

20:                                               ; preds = %12, %1
  %21 = phi i64 [ %17, %12 ], [ %6, %1 ]
  %22 = phi ptr [ %18, %12 ], [ %7, %1 ]
  %23 = phi i64 [ %14, %12 ], [ %2, %1 ]
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 48
  %25 = load i64, ptr %24, align 8, !tbaa !28
  %26 = icmp eq i64 %25, 0
  %27 = load i64, ptr %3, align 8, !tbaa !23
  br i1 %26, label %28, label %30

28:                                               ; preds = %20
  %29 = shl i64 %27, 1
  br label %41

30:                                               ; preds = %20
  %31 = mul i64 %27, %23
  %32 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %33 = load i64, ptr %32, align 8, !tbaa !29
  %34 = udiv i64 %31, %33
  %35 = icmp ult i64 %34, %25
  br i1 %35, label %36, label %43

36:                                               ; preds = %30
  %37 = shl i64 %27, 1
  %38 = mul i64 %33, %25
  %39 = udiv i64 %38, %23
  %40 = tail call i64 @llvm.umin.i64(i64 %39, i64 %37)
  br label %41

41:                                               ; preds = %28, %36
  %42 = phi i64 [ %40, %36 ], [ %29, %28 ]
  tail call void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE13set_next_sizeEm(ptr noundef nonnull %0, i64 noundef %42) #12
  br label %43

43:                                               ; preds = %41, %30
  %44 = add i64 %21, -16
  tail call void @_ZN5boost25simple_segregated_storageImE17add_ordered_blockEPvmm(ptr noundef nonnull %0, ptr noundef nonnull %22, i64 noundef %44, i64 noundef %23) #12
  %45 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %46 = load ptr, ptr %45, align 8, !tbaa !30
  %47 = icmp eq ptr %46, null
  %48 = icmp ugt ptr %46, %22
  %49 = or i1 %47, %48
  br i1 %49, label %50, label %56

50:                                               ; preds = %43
  %51 = getelementptr inbounds nuw i8, ptr %22, i64 %21
  %52 = getelementptr inbounds i8, ptr %51, i64 -16
  store ptr %46, ptr %52, align 8, !tbaa !31
  %53 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %54 = load i64, ptr %53, align 8, !tbaa !32
  %55 = getelementptr inbounds i8, ptr %51, i64 -8
  store i64 %54, ptr %55, align 8, !tbaa !33
  store ptr %22, ptr %45, align 8, !tbaa !31
  store i64 %21, ptr %53, align 8, !tbaa !33
  br label %75

56:                                               ; preds = %43
  %57 = getelementptr inbounds nuw i8, ptr %0, i64 16
  br label %58

58:                                               ; preds = %58, %56
  %59 = phi ptr [ %46, %56 ], [ %64, %58 ]
  %60 = phi ptr [ %57, %56 ], [ %68, %58 ]
  %61 = load i64, ptr %60, align 8, !tbaa !33
  %62 = getelementptr inbounds nuw i8, ptr %59, i64 %61
  %63 = getelementptr inbounds i8, ptr %62, i64 -16
  %64 = load ptr, ptr %63, align 8, !tbaa !31
  %65 = icmp eq ptr %64, null
  %66 = icmp ugt ptr %64, %22
  %67 = or i1 %65, %66
  %68 = getelementptr inbounds i8, ptr %62, i64 -8
  br i1 %67, label %69, label %58, !llvm.loop !34

69:                                               ; preds = %58
  %70 = getelementptr inbounds i8, ptr %62, i64 -16
  %71 = load i64, ptr %68, align 8, !tbaa !33
  %72 = getelementptr inbounds nuw i8, ptr %22, i64 %21
  %73 = getelementptr inbounds i8, ptr %72, i64 -16
  store ptr %64, ptr %73, align 8, !tbaa !31
  %74 = getelementptr inbounds i8, ptr %72, i64 -8
  store i64 %71, ptr %74, align 8, !tbaa !33
  store ptr %22, ptr %70, align 8, !tbaa !31
  store i64 %21, ptr %68, align 8, !tbaa !33
  br label %75

75:                                               ; preds = %69, %50
  %76 = load ptr, ptr %0, align 8, !tbaa !20
  %77 = load ptr, ptr %76, align 8, !tbaa !22
  store ptr %77, ptr %0, align 8, !tbaa !20
  br label %78

78:                                               ; preds = %9, %12, %75
  %79 = phi ptr [ %76, %75 ], [ null, %12 ], [ null, %9 ]
  ret ptr %79
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load i64, ptr %2, align 8, !tbaa !33
  %4 = tail call i64 @llvm.umax.i64(i64 %3, i64 8)
  %5 = add i64 %4, 7
  %6 = icmp ult i64 %5, 8
  br i1 %6, label %7, label %8, !prof !35

7:                                                ; preds = %1
  tail call void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #16
  unreachable

8:                                                ; preds = %1
  %9 = and i64 %5, -8
  ret i64 %9
}

; Function Attrs: minsize mustprogress nounwind optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost33default_user_allocator_new_delete6mallocEm(i64 noundef %0) local_unnamed_addr #6 {
  %2 = tail call noalias ptr @_ZnamRKSt9nothrow_t(i64 noundef %0, ptr noundef nonnull align 1 dereferenceable(1) @_ZSt7nothrow) #17
  ret ptr %2
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE13set_next_sizeEm(ptr noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10max_chunksEv(ptr noundef %0) #12
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 %1)
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 40
  store i64 %4, ptr %5, align 8, !tbaa !36
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 32
  store i64 %4, ptr %6, align 8, !tbaa !23
  ret void
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr void @_ZN5boost25simple_segregated_storageImE17add_ordered_blockEPvmm(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = tail call ptr @_ZN5boost25simple_segregated_storageImE9find_prevEPv(ptr noundef %0, ptr noundef %1) #12
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  tail call void @_ZN5boost25simple_segregated_storageImE9add_blockEPvmm(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) #12
  br label %11

8:                                                ; preds = %4
  %9 = load ptr, ptr %5, align 8, !tbaa !22
  %10 = tail call ptr @_ZN5boost25simple_segregated_storageImE9segregateEPvmmS2_(ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %9) #12
  store ptr %10, ptr %5, align 8, !tbaa !22
  br label %11

11:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: cold minsize noreturn optsize
declare void @__assert_rtn(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: minsize nobuiltin nounwind optsize allocsize(0)
declare noalias ptr @_ZnamRKSt9nothrow_t(i64 noundef, ptr noundef nonnull align 1 dereferenceable(1)) local_unnamed_addr #8

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10max_chunksEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv(ptr noundef %0) #12
  %3 = udiv i64 -17, %2
  ret i64 %3
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost25simple_segregated_storageImE9find_prevEPv(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr %0, align 8, !tbaa !20
  %4 = icmp eq ptr %3, null
  %5 = icmp ugt ptr %3, %1
  %6 = or i1 %4, %5
  br i1 %6, label %13, label %7

7:                                                ; preds = %2, %7
  %8 = phi ptr [ %9, %7 ], [ %3, %2 ]
  %9 = load ptr, ptr %8, align 8, !tbaa !22
  %10 = icmp eq ptr %9, null
  %11 = icmp ugt ptr %9, %1
  %12 = or i1 %10, %11
  br i1 %12, label %13, label %7, !llvm.loop !37

13:                                               ; preds = %7, %2
  %14 = phi ptr [ null, %2 ], [ %8, %7 ]
  ret ptr %14
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr void @_ZN5boost25simple_segregated_storageImE9add_blockEPvmm(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 8, !tbaa !20
  %6 = tail call ptr @_ZN5boost25simple_segregated_storageImE9segregateEPvmmS2_(ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %5) #12
  store ptr %6, ptr %0, align 8, !tbaa !20
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost25simple_segregated_storageImE9segregateEPvmmS2_(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) local_unnamed_addr #6 {
  %5 = sub i64 %1, %2
  %6 = urem i64 %5, %2
  %7 = sub nuw i64 %5, %6
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 %7
  store ptr %3, ptr %8, align 8, !tbaa !22
  %9 = icmp eq i64 %5, %6
  br i1 %9, label %18, label %10

10:                                               ; preds = %4
  %11 = sub i64 0, %2
  br label %12

12:                                               ; preds = %17, %10
  %13 = phi ptr [ %8, %10 ], [ %14, %17 ]
  %14 = getelementptr inbounds i8, ptr %13, i64 %11
  %15 = icmp eq ptr %14, %0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store ptr %13, ptr %0, align 8, !tbaa !22
  br label %18

17:                                               ; preds = %12
  store ptr %13, ptr %14, align 8, !tbaa !22
  br label %12, !llvm.loop !38

18:                                               ; preds = %4, %16
  ret ptr %0
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEC2Emm(ptr noundef returned %0, i64 noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEEC2Emmm(ptr noundef %0, i64 noundef 16, i64 noundef %1, i64 noundef %2) #12
  ret ptr %0
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEEC2Emmm(ptr noundef returned %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, i8 0, i64 24, i1 false)
  store i64 %1, ptr %5, align 8, !tbaa !29
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 32
  store i64 %2, ptr %6, align 8, !tbaa !23
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 40
  store i64 %2, ptr %7, align 8, !tbaa !36
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 48
  store i64 %3, ptr %8, align 8, !tbaa !28
  tail call void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE13set_next_sizeEm(ptr noundef nonnull %0, i64 noundef %2) #12
  tail call void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE12set_max_sizeEm(ptr noundef nonnull %0, i64 noundef %3) #12
  ret ptr %0
}

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE12set_max_sizeEm(ptr noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10max_chunksEv(ptr noundef %0) #12
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 %1)
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 48
  store i64 %4, ptr %5, align 8, !tbaa !28
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED2Ev(ptr noundef returned %0) unnamed_addr #6 personality ptr @__gxx_personality_v0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8, !tbaa !30
  %4 = icmp eq ptr %3, null
  br i1 %4, label %19, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %7 = load i64, ptr %6, align 8, !tbaa !33
  %8 = invoke i64 @_ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv(ptr noundef nonnull %0) #12
          to label %9 unwind label %21

9:                                                ; preds = %5, %9
  %10 = phi i64 [ %14, %9 ], [ %7, %5 ]
  %11 = phi ptr [ %16, %9 ], [ %3, %5 ]
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 %10
  %13 = getelementptr inbounds i8, ptr %12, i64 -8
  %14 = load i64, ptr %13, align 8, !tbaa !33
  %15 = getelementptr inbounds i8, ptr %12, i64 -16
  %16 = load ptr, ptr %15, align 8, !tbaa !31
  tail call void @_ZN5boost33default_user_allocator_new_delete4freeEPc(ptr noundef nonnull %11) #12
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %9, !llvm.loop !39

18:                                               ; preds = %9
  store ptr null, ptr %2, align 8, !tbaa !31
  br label %19

19:                                               ; preds = %1, %18
  %20 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEED2Ev(ptr noundef nonnull %0) #14
  ret ptr %0

21:                                               ; preds = %5
  %22 = landingpad { ptr, i32 }
          catch ptr null
  %23 = extractvalue { ptr, i32 } %22, 0
  tail call void @__clang_call_terminate(ptr %23) #15
  unreachable
}

; Function Attrs: minsize mustprogress nounwind optsize ssp uwtable(sync)
define linkonce_odr void @_ZN5boost33default_user_allocator_new_delete4freeEPc(ptr noundef %0) local_unnamed_addr #6 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %1
  tail call void @_ZdaPv(ptr noundef nonnull %0) #18
  br label %4

4:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEED2Ev(ptr noundef returned %0) unnamed_addr #6 personality ptr @__gxx_personality_v0 {
  %2 = invoke zeroext i1 @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE12purge_memoryEv(ptr noundef %0) #12
          to label %3 unwind label %4

3:                                                ; preds = %1
  ret ptr %0

4:                                                ; preds = %1
  %5 = landingpad { ptr, i32 }
          catch ptr null
  %6 = extractvalue { ptr, i32 } %5, 0
  tail call void @__clang_call_terminate(ptr %6) #15
  unreachable
}

; Function Attrs: minsize nobuiltin nounwind optsize
declare void @_ZdaPv(ptr noundef) local_unnamed_addr #9

; Function Attrs: minsize mustprogress optsize ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE12purge_memoryEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8, !tbaa !31
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %21

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %7 = load i64, ptr %6, align 8, !tbaa !33
  br label %8

8:                                                ; preds = %5, %8
  %9 = phi i64 [ %15, %8 ], [ %7, %5 ]
  %10 = phi ptr [ %13, %8 ], [ %3, %5 ]
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 %9
  %12 = getelementptr inbounds i8, ptr %11, i64 -16
  %13 = load ptr, ptr %12, align 8, !tbaa !31
  %14 = getelementptr inbounds i8, ptr %11, i64 -8
  %15 = load i64, ptr %14, align 8, !tbaa !33
  tail call void @_ZN5boost33default_user_allocator_new_delete4freeEPc(ptr noundef nonnull %10) #12
  %16 = icmp eq ptr %13, null
  br i1 %16, label %17, label %8, !llvm.loop !40

17:                                               ; preds = %8
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 40
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  %19 = load i64, ptr %18, align 8, !tbaa !36
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 32
  store i64 %19, ptr %20, align 8, !tbaa !23
  br label %21

21:                                               ; preds = %1, %17
  ret i1 %4
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

attributes #0 = { minsize mustprogress optsize ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize mustprogress nofree norecurse nosync nounwind optsize ssp willreturn memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #3 = { minsize nofree nounwind optsize "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #4 = { minsize noinline noreturn nounwind optsize ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #5 = { cold nofree noreturn }
attributes #6 = { minsize mustprogress nounwind optsize ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #7 = { cold minsize noreturn optsize "disable-tail-calls"="true" "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #8 = { minsize nobuiltin nounwind optsize allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #9 = { minsize nobuiltin nounwind optsize "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { minsize optsize }
attributes #13 = { nounwind }
attributes #14 = { minsize nounwind optsize }
attributes #15 = { noreturn nounwind }
attributes #16 = { cold minsize noreturn optsize }
attributes #17 = { builtin minsize nounwind optsize allocsize(0) }
attributes #18 = { builtin minsize nounwind optsize }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 27, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 21.0.0 (clang-2100.3.34.2)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"p1 _ZTS4Node", !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !7, i64 0}
!12 = !{!"_ZTS4Node", !7, i64 0, !7, i64 8}
!13 = !{!12, !7, i64 8}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !15}
!20 = !{!21, !8, i64 0}
!21 = !{!"_ZTSN5boost25simple_segregated_storageImEE", !8, i64 0}
!22 = !{!8, !8, i64 0}
!23 = !{!24, !27, i64 32}
!24 = !{!"_ZTSN5boost4poolINS_33default_user_allocator_new_deleteEEE", !21, i64 0, !25, i64 8, !27, i64 24, !27, i64 32, !27, i64 40, !27, i64 48}
!25 = !{!"_ZTSN5boost7details6PODptrImEE", !26, i64 0, !27, i64 8}
!26 = !{!"p1 omnipotent char", !8, i64 0}
!27 = !{!"long", !9, i64 0}
!28 = !{!24, !27, i64 48}
!29 = !{!24, !27, i64 24}
!30 = !{!25, !26, i64 0}
!31 = !{!26, !26, i64 0}
!32 = !{!25, !27, i64 8}
!33 = !{!27, !27, i64 0}
!34 = distinct !{!34, !15}
!35 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!36 = !{!24, !27, i64 40}
!37 = distinct !{!37, !15}
!38 = distinct !{!38, !15}
!39 = distinct !{!39, !15}
!40 = distinct !{!40, !15}
