import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/widgets/code_text.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/screen_utils.dart';

class CodeBox extends StatelessWidget {
  final String code;

  const CodeBox({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    return Container(
      width: 328.w,
      height: 258.h,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border.all(color: AppColors.white, width: 2.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.white),
            trackColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0.3),
            ),
            thickness: MaterialStateProperty.all(2.w),
            radius: Radius.circular(4.r),
            thumbVisibility: MaterialStateProperty.all(true),
            trackVisibility: MaterialStateProperty.all(true),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: RawScrollbar(
                controller: verticalScrollController,
                thumbVisibility: true,
                thickness: 6.w,
                radius: Radius.circular(4.r),
                thumbColor: Colors.white,
                child: SingleChildScrollView(
                  controller: verticalScrollController,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: RawScrollbar(
                    controller: horizontalScrollController,
                    thumbVisibility: true,
                    thickness: 6.h,
                    radius: Radius.circular(4.r),
                    thumbColor: Colors.white,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: SingleChildScrollView(
                      controller: horizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 328.w - 37.w,
                          minHeight: 258.h - 37.h,
                        ),
                        child: CodeText(code),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
