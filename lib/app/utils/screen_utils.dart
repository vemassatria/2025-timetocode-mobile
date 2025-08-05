import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void initScreenUtil(BuildContext context) {
  ScreenUtil.init(
    context,
    designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
  );
}
