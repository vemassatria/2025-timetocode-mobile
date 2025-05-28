import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/games/backend/providers/daftar_level_provider.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class SkipButton extends ConsumerWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);
    final levelCompleted = ref.watch(completedLevelProvider);
    final storyController = ref.read(storyControllerProvider.notifier);
    final storyState = ref.watch(storyControllerProvider);

    final bool isDisabled =
        (levelCompleted < storyState.value!.activeLevel!.level);

    return GestureDetector(
      onTap: () {
        if (isDisabled) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Selesaikan level terlebih dahulu untuk skip."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          storyController.skipToNextSoal();
        }
      },
      child: Stack(
        children: [
          Positioned(
            top: 5.h,
            right: 0.w,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  width: 100.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: isDisabled ? AppColors.gray1 : AppColors.technoBlue,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      width: 2.w,
                      color:
                          isDisabled
                              ? AppColors.secondaryText
                              : AppColors.deepAzure,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.black3,
                          border: Border.all(
                            width: 2.w,
                            color:
                                isDisabled
                                    ? AppColors.secondaryText
                                    : AppColors.deepAzure,
                          ),
                        ),
                        child: Icon(
                          isDisabled ? Icons.lock : Icons.skip_next,
                          color:
                              isDisabled
                                  ? AppColors.secondaryText
                                  : AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "Lewati",
                        style: AppTypography.mediumBold(
                          color:
                              isDisabled
                                  ? AppColors.secondaryText
                                  : AppColors.primaryText,
                        ).copyWith(decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
