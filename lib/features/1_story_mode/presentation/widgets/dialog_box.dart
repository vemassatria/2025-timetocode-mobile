import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/dialog_choices_box.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/typewriter_effect_box.dart';
import 'package:timetocode/app/widgets/popups/confirm_popup.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_choices.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_model.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class DialogBox extends ConsumerStatefulWidget {
  final DialogModel dialog;
  final int indexDialog;
  final String character1Name;
  final String character2Name;

  const DialogBox({
    required this.dialog,
    required this.indexDialog,
    required this.character1Name,
    required this.character2Name,
    super.key,
  });

  @override
  ConsumerState<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends ConsumerState<DialogBox> {
  bool _isTextAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _isTextAnimationComplete = false;
  }

  @override
  void didUpdateWidget(DialogBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.indexDialog != oldWidget.indexDialog && mounted) {
      setState(() => _isTextAnimationComplete = false);
    }
  }

  void _handleTap() {
    final isLastLine = widget.indexDialog == widget.dialog.dialogs.length - 1;
    final hasChoices = widget.dialog.choices?.isNotEmpty == true;

    if (!_isTextAnimationComplete) {
      setState(() => _isTextAnimationComplete = true);
      return;
    }

    if (isLastLine && hasChoices) return;

    ref.read(storyControllerProvider.notifier).nextDialog();
  }

  @override
  Widget build(BuildContext context) {
    final dialog = widget.dialog;
    final idx = widget.indexDialog;
    final currentConversation = dialog.dialogs[idx];
    final charIdx = currentConversation.characterIndex;
    final name = (charIdx == 1) ? widget.character1Name : widget.character2Name;
    final boxColor = (charIdx == 1)
        ? AppColors.challengeOrange
        : AppColors.deepTealGlow;
    final text = currentConversation.line;
    final isLastLine = idx == dialog.dialogs.length - 1;
    final hasChoices = dialog.choices?.isNotEmpty == true;

    final textStyle = AppTypography.medium().copyWith(
      decoration: TextDecoration.none,
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: _handleTap,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _isTextAnimationComplete
                                  ? Text(text, style: textStyle)
                                  : TypewriterEffectBox(
                                      text: text,
                                      textStyle: textStyle,
                                      onFinished: () {
                                        if (mounted &&
                                            !_isTextAnimationComplete) {
                                          setState(
                                            () =>
                                                _isTextAnimationComplete = true,
                                          );
                                        }
                                      },
                                    ),
                            ),
                            SizedBox(height: 12.h),
                            if (_isTextAnimationComplete &&
                                isLastLine &&
                                hasChoices)
                              DialogChoicesBox(
                                choices: dialog.choices!,
                                onPressed: (choice) {
                                  ref
                                      .read(soundEffectServiceProvider.notifier)
                                      .playSelectClick();
                                  _checkAnswer(context, choice);
                                },
                              ),
                            if (_isTextAnimationComplete &&
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

  void _checkAnswer(BuildContext context, DialogChoices selected) {
    showPopupOverlay(
      context,
      ConfirmPopup(
        title: "Yakin ingin merespon?",
        description: "Kamu bisa mencoba respon lainnya.",
        confirmLabel: "Yakin",
        onPrimaryButtonPressed: () {
          ref
              .read(storyControllerProvider.notifier)
              .navigateMode(selected.nextType, selected.next);
          closePopupOverlay(ref);
        },
        onGoBack: () => closePopupOverlay(ref),
      ),
      ref,
    );
  }
}
