import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_progress_controller.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class SkipButton extends ConsumerWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(
      storyControllerProvider.select((state) {
        if (state.activeMode != 'dialog') {
          return false;
        }

        if (state.currentDialog!.branch != null) {
          return state.indexDialog != state.currentDialog!.dialogs.length - 1;
        }

        return true;
      }),
    );

    final levelCompleted = ref.read(storyProgressProvider);
    final currentLevel = ref.read(storyControllerProvider).activeLevel!.level;

    final bool isDisabled = (levelCompleted < currentLevel);

    return Visibility(
      visible: isVisible,
      child: Positioned(
        top: 5.h,
        right: 0.w,
        child: GestureDetector(
          onTap: () {
            if (isDisabled) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Selesaikan level terlebih dahulu untuk skip."),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              ref.read(storyControllerProvider.notifier).skipToNextSoal();
            }
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, right: 16.w),
              child: Container(
                width: 100.w,
                height: 38.h,
                decoration: BoxDecoration(
                  color: isDisabled ? AppColors.gray1 : AppColors.technoBlue,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    width: 2.w,
                    color: isDisabled
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
                          color: isDisabled
                              ? AppColors.secondaryText
                              : AppColors.deepAzure,
                        ),
                      ),
                      child: Icon(
                        isDisabled ? Icons.lock : Icons.skip_next,
                        color: isDisabled
                            ? AppColors.secondaryText
                            : AppColors.white,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "Lewati",
                      style: AppTypography.mediumBold(
                        color: isDisabled
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
      ),
    );
  }
}
