import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/games/backend/models/visual_novel/dialog_choices.dart';
import 'package:timetocode/games/backend/models/visual_novel/dialog_model.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_provider.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/box/dialog_choices_box.dart';

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
    Key? key,
  }) : super(key: key);

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

  void _onBoxTap() {
    if (_isComplete) {
      // Gunakan data dari 'widget' untuk memeriksa kondisi.
      final dialog = widget.dialog;
      final idx = widget.indexDialog;
      final isLastLine = idx == dialog.dialogue.length - 1;

      if (isLastLine && dialog.choices != null && dialog.choices!.isNotEmpty) {
        return; // Jangan lakukan apa-apa, tunggu user memilih.
      }

      // Gunakan ref.read untuk memanggil aksi/fungsi di controller.
      ref.read(storyControllerProvider.notifier).nextDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- PERUBAHAN UTAMA ---
    // Hapus baris-baris ini. Kita tidak lagi memantau state di sini.
    // final asyncState = ref.watch(storyControllerProvider);
    // final story = asyncState.value;
    // if (story == null || ...) { return const SizedBox.shrink(); }

    // Ambil semua data dari parameter 'widget'.
    final dialog = widget.dialog;
    final idx = widget.indexDialog;

    if (_lastIndex != idx) {
      _lastIndex = idx;
      _isComplete = false;
      soundEffectService.playTyping();
    }

    // Gunakan data dari parameter 'widget'.
    final charIdx = dialog.getCharacterIndex(idx);
    final name = (charIdx == 1) ? widget.character1Name : widget.character2Name;
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
              // ... sisa dari UI container sama ...
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
                                // Kunci (key) sangat penting untuk memastikan animasi berjalan
                                // saat index dialog berubah.
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
                                onFinished: () {
                                  soundEffectService.stopTyping();
                                  if (mounted) {
                                    setState(() => _isComplete = true);
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 12.h),
                            // Logika untuk menampilkan pilihan (choices) tidak berubah.
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
                            // Logika untuk menampilkan panah lanjut juga tidak berubah.
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

  // Fungsi _checkAnswer ini sudah benar, tidak perlu diubah karena hanya menggunakan
  // ref.read untuk memanggil aksi controller.
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
          closePopupOverlay(ref);
        },
        onGoBack: () {
          closePopupOverlay(ref);
        },
      ),
      ref,
    );
  }
}
