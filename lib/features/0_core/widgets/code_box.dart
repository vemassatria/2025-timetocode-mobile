import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/0_core/widgets/code_text.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class CodeBox extends StatelessWidget {
  final String code;
  final bool isDragAndDrop;

  const CodeBox({super.key, required this.code, this.isDragAndDrop = false});

  @override
  Widget build(BuildContext context) {
    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    return Container(
      width: 328.w,
      height: 238.h,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border.all(color: AppColors.white, width: 2.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackColor: WidgetStateProperty.all(
              Colors.white.withValues(alpha: 0.3),
            ),
            thickness: WidgetStateProperty.all(2.w),
            radius: Radius.circular(4.r),
            thumbVisibility: WidgetStateProperty.all(true),
            trackVisibility: WidgetStateProperty.all(true),
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
                          minHeight: 238.h - 37.h,
                        ),
                        child: CodeText(
                          data: code,
                          isDragAndDrop: isDragAndDrop,
                        ),
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
