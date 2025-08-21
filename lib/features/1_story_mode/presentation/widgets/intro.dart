import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/typewriter_effect_box.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class IntroBoxWidget extends ConsumerStatefulWidget {
  const IntroBoxWidget({super.key});

  @override
  ConsumerState<IntroBoxWidget> createState() => _IntroBoxWidgetState();
}

class _IntroBoxWidgetState extends ConsumerState<IntroBoxWidget> {
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _isAnimationComplete = false;
  }

  void _handleTap() {
    if (!_isAnimationComplete) {
      setState(() => _isAnimationComplete = true);
      return;
    }
    ref.read(storyControllerProvider.notifier).nextPreDialog();
  }

  @override
  Widget build(BuildContext context) {
    final preDialog = ref.watch(
      storyControllerProvider.select((value) => value.preDialog),
    );

    ref.listen(storyControllerProvider.select((state) => state.preDialog), (
      previous,
      next,
    ) {
      if (previous?.id != next?.id && mounted) {
        _isAnimationComplete = false;
      }
    });

    final textStyle = AppTypography.normal().copyWith(
      decoration: TextDecoration.none,
    );

    return GestureDetector(
      onTap: _handleTap,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _isAnimationComplete
                    ? Text(preDialog!.text, style: textStyle)
                    : TypewriterEffectBox(
                        text: preDialog!.text,
                        textStyle: textStyle,
                        onFinished: () {
                          if (mounted && !_isAnimationComplete) {
                            setState(() => _isAnimationComplete = true);
                          }
                        },
                      ),
              ),
              if (_isAnimationComplete)
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
    );
  }
}
