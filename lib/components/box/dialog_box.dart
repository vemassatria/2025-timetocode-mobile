// lib/components/box/dialog_box.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';
import 'package:timetocode/components/box/dialog_choices_box.dart';

class DialogBox extends ConsumerStatefulWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  ConsumerState<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends ConsumerState<DialogBox> {
  bool _isComplete = false;
  int? _lastIndex;

  void _onBoxTap() {
    final asyncState = ref.read(storyControllerProvider);
    final story = asyncState.value;
    final dialog = story?.currentDialog;
    final idx = story?.indexDialog ?? 0;
    final isLastLine = dialog != null && idx == dialog.dialogue.length - 1;

    if (_isComplete) {
      // Only block if on last line and there are choices
      if (isLastLine && dialog.choices != null && dialog.choices!.isNotEmpty) {
        // Do nothing, wait for user to pick a choice
        return;
      }
      ref.read(storyControllerProvider.notifier).nextDialog();
      setState(() => _isComplete = false);
    } else {
      setState(() => _isComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    final asyncState = ref.watch(storyControllerProvider);
    final story = asyncState.value;

    final dialog = story!.currentDialog!;
    final idx = story.indexDialog!;

    // reset complete when index changes
    if (_lastIndex != idx) {
      _lastIndex = idx;
      _isComplete = false;
    }

    final charIdx = dialog.getCharacterIndex(idx);
    final name =
        (charIdx == 1)
            ? story.activeLevel!.character1
            : story.activeLevel!.character2;
    final boxColor =
        (charIdx == 1) ? AppColors.challengeOrange : AppColors.deepTealGlow;
    final text = dialog.getTextDialog(idx);

    final isLastLine = idx == dialog.dialogue.length - 1;

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: _onBoxTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 36.h, 16.w, 16.h),
              width: 1.sw,
              height: 295.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundTransparent,
                border: Border(
                  top: BorderSide(color: AppColors.white, width: 2.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:
                        _isComplete
                            ? Text(
                              text,
                              style: AppTypography.large().copyWith(
                                decoration: TextDecoration.none,
                              ),
                            )
                            : AnimatedTextKit(
                              key: ValueKey('dialog_$idx'),
                              isRepeatingAnimation: false,
                              displayFullTextOnTap: false,
                              stopPauseOnTap: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  text,
                                  textStyle: AppTypography.medium().copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                  speed: const Duration(milliseconds: 20),
                                  cursor: '_',
                                ),
                              ],
                            ),
                  ),
                  const Spacer(),
                  // FIX: Only show choices at the last line
                  if (_isComplete &&
                      isLastLine &&
                      dialog.choices != null &&
                      dialog.choices!.isNotEmpty)
                    DialogChoicesBox(
                      choices: dialog.choices!,
                      onPressed: (choice) {
                        final storyController = ref.read(
                          storyControllerProvider.notifier,
                        );
                        if (choice.nextType == 'dialog') {
                          storyController.showDialog(choice.next);
                        } else if (choice.nextType == 'soal') {
                          storyController.showQuestion(choice.next);
                        } else {
                          storyController.showEndGame();
                        }
                      },
                    ),
                  if (_isComplete &&
                      (!isLastLine ||
                          dialog.choices == null ||
                          dialog.choices!.isEmpty))
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
      ),
    );
  }
}
