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

; Function Attrs: mustprogress ssp uwtable(sync)
define noundef ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %0, ptr noundef nonnull align 8 dereferenceable(56) %1) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %14

4:                                                ; preds = %2
  %5 = load ptr, ptr %1, align 8, !tbaa !6
  %6 = icmp eq ptr %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %4
  %8 = load ptr, ptr %5, align 8, !tbaa !11
  store ptr %8, ptr %1, align 8, !tbaa !6
  br label %12

9:                                                ; preds = %4
  %10 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv(ptr noundef nonnull %1)
  %11 = icmp eq ptr %10, null
  br i1 %11, label %28, label %12

12:                                               ; preds = %9, %7
  %13 = phi ptr [ %5, %7 ], [ %10, %9 ]
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %13, i8 0, i64 16, i1 false)
  br label %28

14:                                               ; preds = %2
  %15 = add nsw i32 %0, -1
  %16 = tail call ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %15, ptr noundef nonnull align 8 dereferenceable(56) %1)
  %17 = tail call ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %15, ptr noundef nonnull align 8 dereferenceable(56) %1)
  %18 = load ptr, ptr %1, align 8, !tbaa !6
  %19 = icmp eq ptr %18, null
  br i1 %19, label %22, label %20

20:                                               ; preds = %14
  %21 = load ptr, ptr %18, align 8, !tbaa !11
  store ptr %21, ptr %1, align 8, !tbaa !6
  br label %25

22:                                               ; preds = %14
  %23 = tail call ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv(ptr noundef nonnull %1)
  %24 = icmp eq ptr %23, null
  br i1 %24, label %28, label %25

25:                                               ; preds = %22, %20
  %26 = phi ptr [ %18, %20 ], [ %23, %22 ]
  store ptr %16, ptr %26, align 8, !tbaa !12
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 8
  store ptr %17, ptr %27, align 8, !tbaa !15
  br label %28

28:                                               ; preds = %25, %22, %12, %9
  %29 = phi ptr [ %13, %12 ], [ null, %9 ], [ %26, %25 ], [ null, %22 ]
  ret ptr %29
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z14make_iterationiiib(i32 noundef %0, i32 noundef %1, i32 noundef %2, i1 noundef zeroext %3) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %5 = alloca %"class.boost::object_pool", align 8
  %6 = alloca %"class.boost::object_pool", align 8
  br i1 %3, label %7, label %67

7:                                                ; preds = %4
  %8 = sub i32 %1, %0
  %9 = add i32 %8, 1
  %10 = sdiv i32 %9, 16
  %11 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 40
  %13 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %15 = icmp sgt i32 %0, %10
  br label %16

16:                                               ; preds = %7, %62
  %17 = phi i32 [ 0, %7 ], [ %64, %62 ]
  %18 = phi i32 [ 0, %7 ], [ %65, %62 ]
  %19 = mul nsw i32 %18, %10
  %20 = add nsw i32 %19, %10
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %5) #12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %5, i8 0, i64 24, i1 false)
  store <2 x i64> <i64 16, i64 32>, ptr %11, align 8, !tbaa !16
  store <2 x i64> <i64 32, i64 0>, ptr %12, align 8, !tbaa !16
  br i1 %15, label %62, label %21

21:                                               ; preds = %16
  %22 = add nsw i32 %19, %0
  br label %23

23:                                               ; preds = %21, %29
  %24 = phi i32 [ %30, %29 ], [ 0, %21 ]
  %25 = phi i32 [ %31, %29 ], [ %22, %21 ]
  %26 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %2, ptr noundef nonnull align 8 dereferenceable(56) %5)
          to label %27 unwind label %35

27:                                               ; preds = %23
  %28 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %26)
          to label %29 unwind label %35

29:                                               ; preds = %27
  %30 = add nsw i32 %28, %24
  %31 = add nsw i32 %25, 1
  %32 = icmp slt i32 %25, %20
  br i1 %32, label %23, label %38, !llvm.loop !18

33:                                               ; preds = %109, %35
  %34 = phi { ptr, i32 } [ %36, %35 ], [ %110, %109 ]
  resume { ptr, i32 } %34

35:                                               ; preds = %27, %23
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED1Ev(ptr noundef nonnull %5) #12
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %5) #12
  br label %33

38:                                               ; preds = %29
  %39 = load ptr, ptr %13, align 8, !tbaa !20
  %40 = icmp eq ptr %39, null
  br i1 %40, label %62, label %41

41:                                               ; preds = %38
  %42 = load i64, ptr %11, align 8, !tbaa !16
  %43 = call i64 @llvm.umax.i64(i64 %42, i64 8)
  %44 = add i64 %43, 7
  %45 = icmp ult i64 %44, 8
  br i1 %45, label %46, label %48, !prof !22

46:                                               ; preds = %41
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
          to label %47 unwind label %59

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %41
  %49 = load i64, ptr %14, align 8, !tbaa !16
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i64 [ %49, %48 ], [ %57, %50 ]
  %52 = phi ptr [ %39, %48 ], [ %55, %50 ]
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 %51
  %54 = getelementptr inbounds i8, ptr %53, i64 -16
  %55 = load ptr, ptr %54, align 8, !tbaa !20
  %56 = getelementptr inbounds i8, ptr %53, i64 -8
  %57 = load i64, ptr %56, align 8, !tbaa !16
  call void @_ZdaPv(ptr noundef nonnull %52) #14
  %58 = icmp eq ptr %55, null
  br i1 %58, label %62, label %50, !llvm.loop !23

59:                                               ; preds = %46
  %60 = landingpad { ptr, i32 }
          catch ptr null
  %61 = extractvalue { ptr, i32 } %60, 0
  call void @__clang_call_terminate(ptr %61) #15
  unreachable

62:                                               ; preds = %50, %16, %38
  %63 = phi i32 [ %30, %38 ], [ 0, %16 ], [ %30, %50 ]
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %5) #12
  %64 = add nsw i32 %63, %17
  %65 = add nuw nsw i32 %18, 1
  %66 = icmp eq i32 %65, 16
  br i1 %66, label %112, label %16, !llvm.loop !24

67:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %6) #12
  %68 = getelementptr inbounds nuw i8, ptr %6, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %6, i8 0, i64 24, i1 false)
  %69 = getelementptr inbounds nuw i8, ptr %6, i64 40
  store <2 x i64> <i64 16, i64 32>, ptr %68, align 8, !tbaa !16
  store <2 x i64> <i64 32, i64 0>, ptr %69, align 8, !tbaa !16
  %70 = icmp sgt i32 %0, %1
  br i1 %70, label %97, label %99

71:                                               ; preds = %105
  %72 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %73 = load ptr, ptr %72, align 8, !tbaa !20
  %74 = icmp eq ptr %73, null
  br i1 %74, label %97, label %75

75:                                               ; preds = %71
  %76 = load i64, ptr %68, align 8, !tbaa !16
  %77 = call i64 @llvm.umax.i64(i64 %76, i64 8)
  %78 = add i64 %77, 7
  %79 = icmp ult i64 %78, 8
  br i1 %79, label %80, label %82, !prof !22

80:                                               ; preds = %75
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
          to label %81 unwind label %94

81:                                               ; preds = %80
  unreachable

82:                                               ; preds = %75
  %83 = getelementptr inbounds nuw i8, ptr %6, i64 16
  %84 = load i64, ptr %83, align 8, !tbaa !16
  br label %85

85:                                               ; preds = %85, %82
  %86 = phi i64 [ %84, %82 ], [ %92, %85 ]
  %87 = phi ptr [ %73, %82 ], [ %90, %85 ]
  %88 = getelementptr inbounds nuw i8, ptr %87, i64 %86
  %89 = getelementptr inbounds i8, ptr %88, i64 -16
  %90 = load ptr, ptr %89, align 8, !tbaa !20
  %91 = getelementptr inbounds i8, ptr %88, i64 -8
  %92 = load i64, ptr %91, align 8, !tbaa !16
  call void @_ZdaPv(ptr noundef nonnull %87) #14
  %93 = icmp eq ptr %90, null
  br i1 %93, label %97, label %85, !llvm.loop !23

94:                                               ; preds = %80
  %95 = landingpad { ptr, i32 }
          catch ptr null
  %96 = extractvalue { ptr, i32 } %95, 0
  call void @__clang_call_terminate(ptr %96) #15
  unreachable

97:                                               ; preds = %85, %67, %71
  %98 = phi i32 [ %106, %71 ], [ 0, %67 ], [ %106, %85 ]
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %6) #12
  br label %112

99:                                               ; preds = %67, %105
  %100 = phi i32 [ %106, %105 ], [ 0, %67 ]
  %101 = phi i32 [ %107, %105 ], [ %0, %67 ]
  %102 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %2, ptr noundef nonnull align 8 dereferenceable(56) %6)
          to label %103 unwind label %109

103:                                              ; preds = %99
  %104 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %102)
          to label %105 unwind label %109

105:                                              ; preds = %103
  %106 = add nsw i32 %104, %100
  %107 = add i32 %101, 1
  %108 = icmp eq i32 %101, %1
  br i1 %108, label %71, label %99, !llvm.loop !18

109:                                              ; preds = %103, %99
  %110 = landingpad { ptr, i32 }
          cleanup
  %111 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED1Ev(ptr noundef nonnull %6) #12
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %6) #12
  br label %33

112:                                              ; preds = %62, %97
  %113 = phi i32 [ %98, %97 ], [ %64, %62 ]
  ret i32 %113
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress ssp uwtable(sync)
define linkonce_odr i32 @_ZNK4Node5checkEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = load ptr, ptr %0, align 8, !tbaa !12
  %3 = icmp eq ptr %2, null
  br i1 %3, label %17, label %4

4:                                                ; preds = %1, %4
  %5 = phi ptr [ %13, %4 ], [ %2, %1 ]
  %6 = phi ptr [ %10, %4 ], [ %0, %1 ]
  %7 = phi i32 [ %12, %4 ], [ 0, %1 ]
  %8 = tail call i32 @_ZNK4Node5checkEv(ptr noundef nonnull %5)
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %10 = load ptr, ptr %9, align 8, !tbaa !15
  %11 = add i32 %7, 1
  %12 = add i32 %11, %8
  %13 = load ptr, ptr %10, align 8, !tbaa !12
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %4

15:                                               ; preds = %4
  %16 = add nsw i32 %12, 1
  br label %17

17:                                               ; preds = %15, %1
  %18 = phi i32 [ 1, %1 ], [ %16, %15 ]
  ret i32 %18
}

; Function Attrs: mustprogress nounwind ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED1Ev(ptr noundef returned %0) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8, !tbaa !20
  %4 = icmp eq ptr %3, null
  br i1 %4, label %29, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %7 = load i64, ptr %6, align 8, !tbaa !16
  %8 = tail call i64 @llvm.umax.i64(i64 %7, i64 8)
  %9 = add i64 %8, 7
  %10 = icmp ult i64 %9, 8
  br i1 %10, label %11, label %13, !prof !22

11:                                               ; preds = %5
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
          to label %12 unwind label %26

12:                                               ; preds = %11
  unreachable

13:                                               ; preds = %5
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %15 = load i64, ptr %14, align 8, !tbaa !16
  br label %16

16:                                               ; preds = %16, %13
  %17 = phi i64 [ %15, %13 ], [ %23, %16 ]
  %18 = phi ptr [ %3, %13 ], [ %21, %16 ]
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 %17
  %20 = getelementptr inbounds i8, ptr %19, i64 -16
  %21 = load ptr, ptr %20, align 8, !tbaa !20
  %22 = getelementptr inbounds i8, ptr %19, i64 -8
  %23 = load i64, ptr %22, align 8, !tbaa !16
  tail call void @_ZdaPv(ptr noundef nonnull %18) #14
  %24 = icmp eq ptr %21, null
  br i1 %24, label %25, label %16, !llvm.loop !23

25:                                               ; preds = %16
  store ptr null, ptr %2, align 8, !tbaa !20
  br label %29

26:                                               ; preds = %11
  %27 = landingpad { ptr, i32 }
          catch ptr null
  %28 = extractvalue { ptr, i32 } %27, 0
  tail call void @__clang_call_terminate(ptr %28) #15
  unreachable

29:                                               ; preds = %1, %25
  ret ptr %0
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @bench(i32 noundef %0) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %2 = alloca [128 x i8], align 1
  %3 = alloca %"class.boost::object_pool", align 8
  %4 = alloca %"class.boost::object_pool", align 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %2) #12
  %5 = tail call i32 @llvm.smax.i32(i32 %0, i32 6)
  %6 = add nuw nsw i32 %5, 1
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %3) #12
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %3, i8 0, i64 24, i1 false)
  %8 = getelementptr inbounds nuw i8, ptr %3, i64 40
  store <2 x i64> <i64 16, i64 32>, ptr %7, align 8, !tbaa !16
  store <2 x i64> <i64 32, i64 0>, ptr %8, align 8, !tbaa !16
  %9 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %6, ptr noundef nonnull align 8 dereferenceable(56) %3)
          to label %10 unwind label %60

10:                                               ; preds = %1
  %11 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %9)
          to label %12 unwind label %60

12:                                               ; preds = %10
  %13 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str, i32 noundef %6, i32 noundef %11) #12
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %27

15:                                               ; preds = %12
  %16 = zext nneg i32 %13 to i64
  br label %17

17:                                               ; preds = %17, %15
  %18 = phi i64 [ 0, %15 ], [ %25, %17 ]
  %19 = phi i32 [ -2128831035, %15 ], [ %24, %17 ]
  %20 = getelementptr inbounds nuw i8, ptr %2, i64 %18
  %21 = load i8, ptr %20, align 1, !tbaa !25
  %22 = zext i8 %21 to i32
  %23 = xor i32 %19, %22
  %24 = mul i32 %23, 16777619
  %25 = add nuw nsw i64 %18, 1
  %26 = icmp eq i64 %25, %16
  br i1 %26, label %27, label %17, !llvm.loop !26

27:                                               ; preds = %17, %12
  %28 = phi i32 [ -2128831035, %12 ], [ %24, %17 ]
  %29 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %30 = load ptr, ptr %29, align 8, !tbaa !20
  %31 = icmp eq ptr %30, null
  br i1 %31, label %54, label %32

32:                                               ; preds = %27
  %33 = load i64, ptr %7, align 8, !tbaa !16
  %34 = call i64 @llvm.umax.i64(i64 %33, i64 8)
  %35 = add i64 %34, 7
  %36 = icmp ult i64 %35, 8
  br i1 %36, label %37, label %39, !prof !22

37:                                               ; preds = %32
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
          to label %38 unwind label %51

38:                                               ; preds = %37
  unreachable

39:                                               ; preds = %32
  %40 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %41 = load i64, ptr %40, align 8, !tbaa !16
  br label %42

42:                                               ; preds = %42, %39
  %43 = phi i64 [ %41, %39 ], [ %49, %42 ]
  %44 = phi ptr [ %30, %39 ], [ %47, %42 ]
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 %43
  %46 = getelementptr inbounds i8, ptr %45, i64 -16
  %47 = load ptr, ptr %46, align 8, !tbaa !20
  %48 = getelementptr inbounds i8, ptr %45, i64 -8
  %49 = load i64, ptr %48, align 8, !tbaa !16
  call void @_ZdaPv(ptr noundef nonnull %44) #14
  %50 = icmp eq ptr %47, null
  br i1 %50, label %54, label %42, !llvm.loop !23

51:                                               ; preds = %37
  %52 = landingpad { ptr, i32 }
          catch ptr null
  %53 = extractvalue { ptr, i32 } %52, 0
  call void @__clang_call_terminate(ptr %53) #15
  unreachable

54:                                               ; preds = %42, %27
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %3) #12
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #12
  %55 = getelementptr inbounds nuw i8, ptr %4, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false)
  %56 = getelementptr inbounds nuw i8, ptr %4, i64 40
  store <2 x i64> <i64 16, i64 32>, ptr %55, align 8, !tbaa !16
  store <2 x i64> <i64 32, i64 0>, ptr %56, align 8, !tbaa !16
  %57 = invoke ptr @_Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE(i32 noundef %5, ptr noundef nonnull align 8 dereferenceable(56) %4)
          to label %65 unwind label %63

58:                                               ; preds = %86
  %59 = invoke i32 @_ZNK4Node5checkEv(ptr noundef %57)
          to label %92 unwind label %63

60:                                               ; preds = %10, %1
  %61 = landingpad { ptr, i32 }
          cleanup
  %62 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED1Ev(ptr noundef nonnull %3) #12
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %3) #12
  br label %138

63:                                               ; preds = %58, %54
  %64 = landingpad { ptr, i32 }
          cleanup
  br label %135

65:                                               ; preds = %54, %86
  %66 = phi i32 [ %87, %86 ], [ %28, %54 ]
  %67 = phi i32 [ %88, %86 ], [ 4, %54 ]
  %68 = sub nuw nsw i32 %5, %67
  %69 = shl nuw i32 16, %68
  %70 = invoke i32 @_Z14make_iterationiiib(i32 noundef 1, i32 noundef %69, i32 noundef %67, i1 noundef zeroext true)
          to label %71 unwind label %90

71:                                               ; preds = %65
  %72 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str.1, i32 noundef %69, i32 noundef %67, i32 noundef %70) #12
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %86

74:                                               ; preds = %71
  %75 = zext nneg i32 %72 to i64
  br label %76

76:                                               ; preds = %76, %74
  %77 = phi i64 [ 0, %74 ], [ %84, %76 ]
  %78 = phi i32 [ %66, %74 ], [ %83, %76 ]
  %79 = getelementptr inbounds nuw i8, ptr %2, i64 %77
  %80 = load i8, ptr %79, align 1, !tbaa !25
  %81 = zext i8 %80 to i32
  %82 = xor i32 %78, %81
  %83 = mul i32 %82, 16777619
  %84 = add nuw nsw i64 %77, 1
  %85 = icmp eq i64 %84, %75
  br i1 %85, label %86, label %76, !llvm.loop !26

86:                                               ; preds = %76, %71
  %87 = phi i32 [ %66, %71 ], [ %83, %76 ]
  %88 = add nuw nsw i32 %67, 2
  %89 = icmp samesign ugt i32 %88, %5
  br i1 %89, label %58, label %65, !llvm.loop !27

90:                                               ; preds = %65
  %91 = landingpad { ptr, i32 }
          cleanup
  br label %135

92:                                               ; preds = %58
  %93 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %2, i64 noundef 128, ptr noundef nonnull @.str.2, i32 noundef %5, i32 noundef %59) #12
  %94 = icmp sgt i32 %93, 0
  br i1 %94, label %95, label %107

95:                                               ; preds = %92
  %96 = zext nneg i32 %93 to i64
  br label %97

97:                                               ; preds = %97, %95
  %98 = phi i64 [ 0, %95 ], [ %105, %97 ]
  %99 = phi i32 [ %87, %95 ], [ %104, %97 ]
  %100 = getelementptr inbounds nuw i8, ptr %2, i64 %98
  %101 = load i8, ptr %100, align 1, !tbaa !25
  %102 = zext i8 %101 to i32
  %103 = xor i32 %99, %102
  %104 = mul i32 %103, 16777619
  %105 = add nuw nsw i64 %98, 1
  %106 = icmp eq i64 %105, %96
  br i1 %106, label %107, label %97, !llvm.loop !26

107:                                              ; preds = %97, %92
  %108 = phi i32 [ %87, %92 ], [ %104, %97 ]
  %109 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %110 = load ptr, ptr %109, align 8, !tbaa !20
  %111 = icmp eq ptr %110, null
  br i1 %111, label %134, label %112

112:                                              ; preds = %107
  %113 = load i64, ptr %55, align 8, !tbaa !16
  %114 = call i64 @llvm.umax.i64(i64 %113, i64 8)
  %115 = add i64 %114, 7
  %116 = icmp ult i64 %115, 8
  br i1 %116, label %117, label %119, !prof !22

117:                                              ; preds = %112
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
          to label %118 unwind label %131

118:                                              ; preds = %117
  unreachable

119:                                              ; preds = %112
  %120 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %121 = load i64, ptr %120, align 8, !tbaa !16
  br label %122

122:                                              ; preds = %122, %119
  %123 = phi i64 [ %121, %119 ], [ %129, %122 ]
  %124 = phi ptr [ %110, %119 ], [ %127, %122 ]
  %125 = getelementptr inbounds nuw i8, ptr %124, i64 %123
  %126 = getelementptr inbounds i8, ptr %125, i64 -16
  %127 = load ptr, ptr %126, align 8, !tbaa !20
  %128 = getelementptr inbounds i8, ptr %125, i64 -8
  %129 = load i64, ptr %128, align 8, !tbaa !16
  call void @_ZdaPv(ptr noundef nonnull %124) #14
  %130 = icmp eq ptr %127, null
  br i1 %130, label %134, label %122, !llvm.loop !23

131:                                              ; preds = %117
  %132 = landingpad { ptr, i32 }
          catch ptr null
  %133 = extractvalue { ptr, i32 } %132, 0
  call void @__clang_call_terminate(ptr %133) #15
  unreachable

134:                                              ; preds = %122, %107
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #12
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %2) #12
  ret i32 %108

135:                                              ; preds = %90, %63
  %136 = phi { ptr, i32 } [ %91, %90 ], [ %64, %63 ]
  %137 = call ptr @_ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEED1Ev(ptr noundef nonnull %4) #12
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #12
  br label %138

138:                                              ; preds = %135, %60
  %139 = phi { ptr, i32 } [ %136, %135 ], [ %61, %60 ]
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %2) #12
  resume { ptr, i32 } %139
}

; Function Attrs: nofree nounwind
declare noundef i32 @snprintf(ptr noalias noundef writeonly captures(none), i64 noundef, ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #4 {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #12
  tail call void @_ZSt9terminatev() #15
  unreachable
}

; Function Attrs: cold nofree noreturn
declare void @_ZSt9terminatev() local_unnamed_addr #5

; Function Attrs: mustprogress ssp uwtable(sync)
define linkonce_odr ptr @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv(ptr noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load i64, ptr %2, align 8, !tbaa !16
  %4 = tail call i64 @llvm.umax.i64(i64 %3, i64 8)
  %5 = add i64 %4, 7
  %6 = icmp ult i64 %5, 8
  br i1 %6, label %7, label %8, !prof !22

7:                                                ; preds = %1
  call void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv.cold.1() #16
  unreachable

8:                                                ; preds = %1
  %9 = and i64 %5, -8
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %11 = load i64, ptr %10, align 8, !tbaa !28
  %12 = mul i64 %11, %9
  %13 = add i64 %12, 16
  %14 = tail call noalias ptr @_ZnamRKSt9nothrow_t(i64 noundef %13, ptr noundef nonnull align 1 dereferenceable(1) @_ZSt7nothrow) #17
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %8
  %17 = icmp ugt i64 %11, 4
  br i1 %17, label %18, label %129

18:                                               ; preds = %16
  %19 = lshr i64 %11, 1
  store i64 %19, ptr %10, align 8, !tbaa !28
  %20 = mul i64 %19, %9
  %21 = add i64 %20, 16
  %22 = tail call noalias ptr @_ZnamRKSt9nothrow_t(i64 noundef %21, ptr noundef nonnull align 1 dereferenceable(1) @_ZSt7nothrow) #17
  %23 = icmp eq ptr %22, null
  br i1 %23, label %129, label %24

24:                                               ; preds = %18, %8
  %25 = phi i64 [ %19, %18 ], [ %11, %8 ]
  %26 = phi i64 [ %21, %18 ], [ %13, %8 ]
  %27 = phi ptr [ %22, %18 ], [ %14, %8 ]
  %28 = getelementptr inbounds nuw i8, ptr %0, i64 48
  %29 = load i64, ptr %28, align 8, !tbaa !31
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %24
  %32 = shl i64 %25, 1
  br label %42

33:                                               ; preds = %24
  %34 = mul i64 %25, %9
  %35 = udiv i64 %34, %3
  %36 = icmp ult i64 %35, %29
  br i1 %36, label %37, label %47

37:                                               ; preds = %33
  %38 = shl i64 %25, 1
  %39 = mul i64 %29, %3
  %40 = udiv i64 %39, %9
  %41 = tail call i64 @llvm.umin.i64(i64 %40, i64 %38)
  br label %42

42:                                               ; preds = %31, %37
  %43 = phi i64 [ %41, %37 ], [ %32, %31 ]
  %44 = udiv i64 -17, %9
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 %43)
  %46 = getelementptr inbounds nuw i8, ptr %0, i64 40
  store i64 %45, ptr %46, align 8, !tbaa !32
  store i64 %45, ptr %10, align 8, !tbaa !28
  br label %47

47:                                               ; preds = %42, %33
  %48 = add i64 %26, -16
  %49 = load ptr, ptr %0, align 8, !tbaa !6
  %50 = icmp eq ptr %49, null
  %51 = icmp ugt ptr %49, %27
  %52 = or i1 %50, %51
  br i1 %52, label %59, label %53

53:                                               ; preds = %47, %53
  %54 = phi ptr [ %55, %53 ], [ %49, %47 ]
  %55 = load ptr, ptr %54, align 8, !tbaa !11
  %56 = icmp eq ptr %55, null
  %57 = icmp ugt ptr %55, %27
  %58 = or i1 %56, %57
  br i1 %58, label %75, label %53, !llvm.loop !33

59:                                               ; preds = %47
  %60 = sub i64 %48, %9
  %61 = urem i64 %60, %9
  %62 = sub nuw i64 %60, %61
  %63 = getelementptr inbounds nuw i8, ptr %27, i64 %62
  store ptr %49, ptr %63, align 8, !tbaa !11
  %64 = icmp eq i64 %60, %61
  br i1 %64, label %94, label %65

65:                                               ; preds = %59
  %66 = sub i64 0, %9
  %67 = icmp eq i64 %62, %9
  br i1 %67, label %91, label %68

68:                                               ; preds = %65
  %69 = getelementptr inbounds i8, ptr %63, i64 %66
  br label %70

70:                                               ; preds = %70, %68
  %71 = phi ptr [ %73, %70 ], [ %69, %68 ]
  %72 = phi ptr [ %71, %70 ], [ %63, %68 ]
  store ptr %72, ptr %71, align 8, !tbaa !11
  %73 = getelementptr inbounds i8, ptr %71, i64 %66
  %74 = icmp eq ptr %73, %27
  br i1 %74, label %91, label %70, !llvm.loop !34

75:                                               ; preds = %53
  %76 = sub i64 %48, %9
  %77 = urem i64 %76, %9
  %78 = sub nuw i64 %76, %77
  %79 = getelementptr inbounds nuw i8, ptr %27, i64 %78
  store ptr %55, ptr %79, align 8, !tbaa !11
  %80 = icmp eq i64 %76, %77
  br i1 %80, label %94, label %81

81:                                               ; preds = %75
  %82 = sub i64 0, %9
  %83 = icmp eq i64 %78, %9
  br i1 %83, label %91, label %84

84:                                               ; preds = %81
  %85 = getelementptr inbounds i8, ptr %79, i64 %82
  br label %86

86:                                               ; preds = %86, %84
  %87 = phi ptr [ %89, %86 ], [ %85, %84 ]
  %88 = phi ptr [ %87, %86 ], [ %79, %84 ]
  store ptr %88, ptr %87, align 8, !tbaa !11
  %89 = getelementptr inbounds i8, ptr %87, i64 %82
  %90 = icmp eq ptr %89, %27
  br i1 %90, label %91, label %86, !llvm.loop !34

91:                                               ; preds = %86, %70, %81, %65
  %92 = phi ptr [ %63, %65 ], [ %79, %81 ], [ %71, %70 ], [ %87, %86 ]
  %93 = phi ptr [ %0, %65 ], [ %54, %81 ], [ %0, %70 ], [ %54, %86 ]
  store ptr %92, ptr %27, align 8, !tbaa !11
  br label %94

94:                                               ; preds = %59, %75, %91
  %95 = phi ptr [ %0, %59 ], [ %54, %75 ], [ %93, %91 ]
  store ptr %27, ptr %95, align 8, !tbaa !11
  %96 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %97 = load ptr, ptr %96, align 8, !tbaa !35
  %98 = icmp eq ptr %97, null
  %99 = icmp ugt ptr %97, %27
  %100 = or i1 %98, %99
  br i1 %100, label %101, label %107

101:                                              ; preds = %94
  %102 = getelementptr inbounds nuw i8, ptr %27, i64 %26
  %103 = getelementptr inbounds i8, ptr %102, i64 -16
  store ptr %97, ptr %103, align 8, !tbaa !20
  %104 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %105 = load i64, ptr %104, align 8, !tbaa !36
  %106 = getelementptr inbounds i8, ptr %102, i64 -8
  store i64 %105, ptr %106, align 8, !tbaa !16
  store ptr %27, ptr %96, align 8, !tbaa !20
  store i64 %26, ptr %104, align 8, !tbaa !16
  br label %126

107:                                              ; preds = %94
  %108 = getelementptr inbounds nuw i8, ptr %0, i64 16
  br label %109

109:                                              ; preds = %109, %107
  %110 = phi ptr [ %97, %107 ], [ %115, %109 ]
  %111 = phi ptr [ %108, %107 ], [ %119, %109 ]
  %112 = load i64, ptr %111, align 8, !tbaa !16
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 %112
  %114 = getelementptr inbounds i8, ptr %113, i64 -16
  %115 = load ptr, ptr %114, align 8, !tbaa !20
  %116 = icmp eq ptr %115, null
  %117 = icmp ugt ptr %115, %27
  %118 = or i1 %116, %117
  %119 = getelementptr inbounds i8, ptr %113, i64 -8
  br i1 %118, label %120, label %109, !llvm.loop !37

120:                                              ; preds = %109
  %121 = getelementptr inbounds i8, ptr %113, i64 -16
  %122 = load i64, ptr %119, align 8, !tbaa !16
  %123 = getelementptr inbounds nuw i8, ptr %27, i64 %26
  %124 = getelementptr inbounds i8, ptr %123, i64 -16
  store ptr %115, ptr %124, align 8, !tbaa !20
  %125 = getelementptr inbounds i8, ptr %123, i64 -8
  store i64 %122, ptr %125, align 8, !tbaa !16
  store ptr %27, ptr %121, align 8, !tbaa !20
  store i64 %26, ptr %119, align 8, !tbaa !16
  br label %126

126:                                              ; preds = %120, %101
  %127 = load ptr, ptr %0, align 8, !tbaa !6
  %128 = load ptr, ptr %127, align 8, !tbaa !11
  store ptr %128, ptr %0, align 8, !tbaa !6
  br label %129

129:                                              ; preds = %16, %18, %126
  %130 = phi ptr [ %127, %126 ], [ null, %18 ], [ null, %16 ]
  ret ptr %130
}

; Function Attrs: cold noreturn
declare void @__assert_rtn(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: nobuiltin nounwind allocsize(0)
declare noalias ptr @_ZnamRKSt9nothrow_t(i64 noundef, ptr noundef nonnull align 1 dereferenceable(1)) local_unnamed_addr #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(ptr noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #9

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #9

; Function Attrs: cold minsize mustprogress noreturn ssp uwtable(sync)
define internal void @_ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv.cold.1() #11 {
  br label %1

1:                                                ; preds = %0
  tail call void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost4poolINS_33default_user_allocator_new_deleteEE10alloc_sizeEv, ptr noundef nonnull @.str.3, i32 noundef 355, ptr noundef nonnull @.str.4) #13
  unreachable
}

attributes #0 = { mustprogress ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #4 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #5 = { cold nofree noreturn }
attributes #6 = { cold noreturn "disable-tail-calls"="true" "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #7 = { nobuiltin nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #8 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { cold minsize mustprogress noreturn ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a" }
attributes #12 = { nounwind }
attributes #13 = { cold noreturn }
attributes #14 = { builtin nounwind }
attributes #15 = { noreturn nounwind }
attributes #16 = { noinline }
attributes #17 = { builtin nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 27, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 21.0.0 (clang-2100.3.34.2)"}
!6 = !{!7, !8, i64 0}
!7 = !{!"_ZTSN5boost25simple_segregated_storageImEE", !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!8, !8, i64 0}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS4Node", !14, i64 0, !14, i64 8}
!14 = !{!"p1 _ZTS4Node", !8, i64 0}
!15 = !{!13, !14, i64 8}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !9, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!21, !21, i64 0}
!21 = !{!"p1 omnipotent char", !8, i64 0}
!22 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!23 = distinct !{!23, !19}
!24 = distinct !{!24, !19}
!25 = !{!9, !9, i64 0}
!26 = distinct !{!26, !19}
!27 = distinct !{!27, !19}
!28 = !{!29, !17, i64 32}
!29 = !{!"_ZTSN5boost4poolINS_33default_user_allocator_new_deleteEEE", !7, i64 0, !30, i64 8, !17, i64 24, !17, i64 32, !17, i64 40, !17, i64 48}
!30 = !{!"_ZTSN5boost7details6PODptrImEE", !21, i64 0, !17, i64 8}
!31 = !{!29, !17, i64 48}
!32 = !{!29, !17, i64 40}
!33 = distinct !{!33, !19}
!34 = distinct !{!34, !19}
!35 = !{!30, !21, i64 0}
!36 = !{!30, !17, i64 8}
!37 = distinct !{!37, !19}
