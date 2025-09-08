import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/dialog_choices_box.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/typewriter_effect_box.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

final isDialogBoxTextAnimationCompleteProvider =
    StateProvider.autoDispose<bool>((ref) => false);

class DialogBox extends ConsumerStatefulWidget {
  const DialogBox({super.key});

  @override
  ConsumerState<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends ConsumerState<DialogBox>
    with SingleTickerProviderStateMixin {
  late String _character1Name;
  late String _character2Name;
  Timer? _timer;
  int? _countdown;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _character1Name = ref.read(
      storyControllerProvider.select((state) => state.activeLevel!.character1),
    );
    _character2Name = ref.read(
      storyControllerProvider.select((state) => state.activeLevel!.character2),
    );
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  void _stopTimerAndAnimation() {
    _timer?.cancel();
    _animationController?.stop();
    _timer = null;
  }

  void _startTimer(int seconds) {
    _countdown = seconds;
    _animationController?.duration = Duration(seconds: seconds);
    _animationController?.reset();
    _animationController?.forward();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown! > 1) {
        _countdown = _countdown! - 1;
      } else {
        _stopTimerAndAnimation();
        final dialog = ref.read(storyControllerProvider).currentDialog;
        ref
            .read(storyControllerProvider.notifier)
            .navigateMode('dialog', dialog!.branch!.canon!);
      }
    });
  }

  void _handleTap(bool isLastLine, bool hasChoices) {
    if (!ref.read(isDialogBoxTextAnimationCompleteProvider)) {
      ref.read(isDialogBoxTextAnimationCompleteProvider.notifier).state = true;
      return;
    }

    if (isLastLine && hasChoices) return;

    ref.read(storyControllerProvider.notifier).nextDialog();
  }

  @override
  Widget build(BuildContext context) {
    final dialog = ref.watch(
      storyControllerProvider.select((state) => state.currentDialog),
    );
    final indexDialog = ref.watch(
      storyControllerProvider.select((state) => state.indexDialog),
    );

    ref.listen(
      storyControllerProvider.select(
        (state) => (state.currentDialog!.id, state.indexDialog),
      ),
      (previous, next) {
        if (previous != next && mounted) {
          ref.read(isDialogBoxTextAnimationCompleteProvider.notifier).state =
              false;
        }
      },
    );

    final currentConversation = dialog!.dialogs[indexDialog!];
    final charIdx = currentConversation.characterIndex;
    final name = (charIdx == 1) ? _character1Name : _character2Name;
    final boxColor = (charIdx == 1)
        ? AppColors.challengeOrange
        : AppColors.deepTealGlow;
    final text = currentConversation.line;
    final isLastLine = indexDialog == dialog.dialogs.length - 1;
    final hasChoices = dialog.branch != null;

    final textStyle = AppTypography.medium().copyWith(
      decoration: TextDecoration.none,
    );

    if (isLastLine && hasChoices && dialog.branch?.timer != null) {
      _startTimer(dialog.branch!.timer!);
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () => _handleTap(isLastLine, hasChoices),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 36.h, 16.w, 16.h),
              width: 1.sw,
              height: 295.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundTransparent,
                border: Border(
                  top: BorderSide(color: AppColors.white, width: 2.w),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Consumer(
                          child:
                              (isLastLine &&
                                  hasChoices &&
                                  dialog.branch?.timer != null)
                              ? AnimatedBuilder(
                                  animation: _animationController!,
                                  builder: (context, child) {
                                    return LinearProgressIndicator(
                                      value: 1.0 - _animationController!.value,
                                      backgroundColor: AppColors.gray1
                                          .withValues(alpha: 0.5),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                            AppColors.dangerRed,
                                          ),
                                    );
                                  },
                                )
                              : null,
                          builder: (context, ref, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (child != null) ...{
                                  child,
                                  SizedBox(height: 12.h),
                                },
                                Expanded(
                                  child:
                                      ref.watch(
                                        isDialogBoxTextAnimationCompleteProvider,
                                      )
                                      ? Text(text, style: textStyle)
                                      : TypewriterEffectBox(
                                          key: ValueKey(
                                            "${dialog.id} + $indexDialog",
                                          ),
                                          text: text,
                                          textStyle: textStyle,
                                          onFinished: () {
                                            if (mounted &&
                                                !ref.watch(
                                                  isDialogBoxTextAnimationCompleteProvider,
                                                )) {
                                              ref
                                                      .read(
                                                        isDialogBoxTextAnimationCompleteProvider
                                                            .notifier,
                                                      )
                                                      .state =
                                                  true;
                                            }
                                          },
                                        ),
                                ),
                                SizedBox(height: 12.h),
                                if (ref.watch(
                                      isDialogBoxTextAnimationCompleteProvider,
                                    ) &&
                                    isLastLine &&
                                    hasChoices)
                                  DialogChoicesBox(
                                    choices: dialog.branch!.choices,
                                    onPressed: (choice) {
                                      _stopTimerAndAnimation();
                                      ref
                                          .read(
                                            soundEffectServiceProvider.notifier,
                                          )
                                          .playSelectClick();
                                      ref
                                          .read(
                                            storyControllerProvider.notifier,
                                          )
                                          .navigateMode(
                                            choice.nextType,
                                            choice.next,
                                          );
                                    },
                                  ),
                                if (ref.watch(
                                      isDialogBoxTextAnimationCompleteProvider,
                                    ) &&
                                    (!isLastLine || !hasChoices))
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      size: 32.sp,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 16,
            child: Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(color: AppColors.white, width: 2.w),
              ),
              child: Text(
                name,
                style: AppTypography.large().copyWith(
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
