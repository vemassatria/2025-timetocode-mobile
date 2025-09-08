import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/typewriter_effect_box.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

final _isIntroBoxTextAnimationCompleteProvider =
    StateProvider.autoDispose<bool>((ref) => false);

class IntroBoxWidget extends ConsumerWidget {
  const IntroBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preDialog = ref.watch(
      storyControllerProvider.select((value) => value.preDialog),
    );

    ref.listen(storyControllerProvider.select((state) => state.preDialog), (
      previous,
      next,
    ) {
      if (previous?.id != next?.id) {
        ref.read(_isIntroBoxTextAnimationCompleteProvider.notifier).state =
            false;
      }
    });

    final textStyle = AppTypography.normal().copyWith(
      decoration: TextDecoration.none,
    );

    return GestureDetector(
      onTap: () {
        if (!ref.watch(_isIntroBoxTextAnimationCompleteProvider)) {
          ref.read(_isIntroBoxTextAnimationCompleteProvider.notifier).state =
              true;
          return;
        }
        ref.read(storyControllerProvider.notifier).nextPreDialog();
      },
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          height: 250.h,
          width: 328.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundTransparent,
            border: Border.all(color: AppColors.white),
          ),
          child: Consumer(
            builder: (context, ref, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ref.watch(_isIntroBoxTextAnimationCompleteProvider)
                      ? Text(preDialog!.text, style: textStyle)
                      : TypewriterEffectBox(
                          text: preDialog!.text,
                          textStyle: textStyle,
                          onFinished: () {
                            if (!ref.watch(
                              _isIntroBoxTextAnimationCompleteProvider,
                            )) {
                              ref
                                      .read(
                                        _isIntroBoxTextAnimationCompleteProvider
                                            .notifier,
                                      )
                                      .state =
                                  true;
                            }
                          },
                        ),
                ),
                if (ref.watch(_isIntroBoxTextAnimationCompleteProvider))
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      size: 32.sp,
                      color: AppColors.primaryText,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
