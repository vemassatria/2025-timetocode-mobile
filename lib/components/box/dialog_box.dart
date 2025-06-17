// lib/components/box/dialog_box.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/games/backend/models/dialog_choices.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
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
  late final SoundEffectService soundEffectService;

  @override
  void initState() {
    soundEffectService = ref.read(soundEffectServiceProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    soundEffectService.stopTyping();
    super.dispose();
  }

  // --- PERUBAHAN LOGIKA TAP UTAMA ---
  // Logika ini sekarang sama dengan `_handleTap` di NarrationBox.
  void _onBoxTap() {
    // Jika animasi sudah selesai, lanjutkan ke dialog berikutnya.
    if (_isComplete) {
      final story = ref.read(storyControllerProvider).value;
      final dialog = story?.currentDialog;
      final idx = story?.indexDialog ?? 0;
      final isLastLine = dialog != null && idx == dialog.dialogue.length - 1;

      // Jangan lakukan apa-apa jika ini baris terakhir dan ada pilihan.
      // Menunggu user untuk memilih dari DialogChoicesBox.
      if (isLastLine && dialog.choices != null && dialog.choices!.isNotEmpty) {
        return;
      }

      ref.read(storyControllerProvider.notifier).nextDialog();
    }
    // Jika animasi belum selesai, tidak melakukan apa-apa di sini.
    // `AnimatedTextKit` dengan `displayFullTextOnTap: true` akan menanganinya.
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    final asyncState = ref.watch(storyControllerProvider);
    final story = asyncState.value;

    if (story == null ||
        story.currentDialog == null ||
        story.indexDialog == null) {
      return const SizedBox.shrink();
    }

    final dialog = story.currentDialog!;
    final idx = story.indexDialog!;

    // Reset _isComplete setiap kali index dialog berubah.
    if (_lastIndex != idx) {
      _lastIndex = idx;
      _isComplete = false;
      soundEffectService.playTyping();
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
        onTap: _onBoxTap, // Handler tap utama ada di sini.
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
                              child: AnimatedTextKit(
                                key: ValueKey('dialog_$idx'),
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
                                isRepeatingAnimation: false,
                                displayFullTextOnTap: true,
                                onTap: () {
                                  soundEffectService.stopTyping();
                                  if (mounted && !_isComplete) {
                                    setState(() => _isComplete = true);
                                  }
                                },
                                // `onFinished` dipanggil saat animasi selesai secara natural.
                                onFinished: () {
                                  soundEffectService.stopTyping();
                                  if (mounted) {
                                    setState(() => _isComplete = true);
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 12),
                            if (_isComplete &&
                                isLastLine &&
                                dialog.choices != null &&
                                dialog.choices!.isNotEmpty)
                              DialogChoicesBox(
                                choices: dialog.choices!,
                                onPressed: (choice) {
                                  soundEffectService.playSelectClick();
                                  _checkAnswer(context, choice);
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
                    ),
                  );
                },
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

  void _checkAnswer(BuildContext context, DialogChoices selected) {
    showPopupOverlay(
      context,
      ConfirmPopup(
        title: "Yakin ingin merespon?",
        description: "Kamu bisa mencoba respon lainnya.",
        confirmLabel: "Yakin",
        onPrimaryButtonPressed: () {
          final storyController = ref.read(storyControllerProvider.notifier);
          if (selected.nextType == 'dialog') {
            storyController.showDialog(selected.next);
          } else if (selected.nextType == 'soal') {
            storyController.showQuestion(selected.next);
          } else {
            storyController.showEndGame();
          }
          closePopupOverlay();
        },
        onGoBack: () {
          closePopupOverlay();
        },
      ),
    );
  }
}
