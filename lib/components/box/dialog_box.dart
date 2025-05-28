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
      setState(() => _isComplete = false); // Reset for the next dialog line
    } else {
      // If animation is not complete, tapping will complete it.
      // The AnimatedTextKit's displayFullTextOnTap could also handle this,
      // but explicitly setting _isComplete ensures our state is correct.
      setState(() => _isComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    final asyncState = ref.watch(storyControllerProvider);
    final story = asyncState.value;

    // If story or currentDialog is null, perhaps show a loading or empty state
    if (story == null ||
        story.currentDialog == null ||
        story.indexDialog == null) {
      return const SizedBox.shrink(); // Or some placeholder
    }

    final dialog = story.currentDialog!;
    final idx = story.indexDialog!;

    // reset complete when index changes
    // This should ideally happen BEFORE the build method uses _isComplete for the new text
    // However, placing it here might still work due to the order of operations in build.
    // A safer place might be in a didUpdateWidget or reacting to provider changes.
    // For now, this seems to be your current logic.
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
                              key: ValueKey(
                                'dialog_$idx',
                              ), // Good use of ValueKey
                              isRepeatingAnimation: false,
                              displayFullTextOnTap:
                                  true, // Allow tap on text to complete it
                              stopPauseOnTap: true, // Stop animation on tap
                              onFinished: () {
                                // Automatically set _isComplete to true when animation finishes
                                if (mounted) {
                                  // Check if widget is still in tree
                                  setState(() {
                                    _isComplete = true;
                                  });
                                }
                              },
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
                        // Ensure _isComplete is reset when a choice is made and new content loads
                        // This might already be handled if showDialog/showQuestion resets the index
                        // but being explicit can be safer depending on storyController's implementation.
                        // setState(() => _isComplete = false); // Consider if needed here
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
