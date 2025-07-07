import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/ui_provider.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/widgets/code_text.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class ChallengeGameplayPage extends ConsumerStatefulWidget {
  const ChallengeGameplayPage({super.key});

  @override
  ConsumerState<ChallengeGameplayPage> createState() =>
      _ChallengeGameplayPageState();
}

class _ChallengeGameplayPageState extends ConsumerState<ChallengeGameplayPage> {
  ChoicesModel? selectedAnswer;
  late final SoundEffectService soundEffectService;

  @override
  void initState() {
    super.initState();
    soundEffectService = ref.read(soundEffectServiceProvider.notifier);
  }

  void selectAnswer(ChoicesModel answer) {
    setState(() => selectedAnswer = answer);
  }

  void clearSelection() {
    setState(() => selectedAnswer = null);
  }

  @override
  Widget build(BuildContext context) {
    final challengeAsync = ref.watch(challengeControllerProvider);
    final challengeController = ref.read(challengeControllerProvider.notifier);

    return challengeAsync.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, s) => Scaffold(body: Center(child: Text("Error: $e"))),
      data: (challengeState) {
        final code = challengeState.currentQuestion!.code;
        return PopScope(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.surfaceDark,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.menu, color: AppColors.primaryText),
                onPressed: () {
                  showPopupOverlay(
                    context,
                    MenuPopup(
                      onRestart: () {
                        challengeController.resetChallenge();
                        closePopupOverlay(ref);
                      },
                      onExit: () {
                        challengeController.endChallengePopup();
                        closePopupOverlay(ref);
                      },
                      onClose: () {
                        closePopupOverlay(ref);
                      },
                      onGoBack: () {
                        closePopupOverlay(ref);
                      },
                    ),
                    ref,
                  );
                },
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColors.xpGreen),
                    SizedBox(
                      width: 35.w,
                      child: Text(
                        "${challengeState.correctAnswer}/3",
                        style: AppTypography.mediumBold(),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.cancel, color: AppColors.dangerRed),
                    SizedBox(
                      width: 35.w,
                      child: Text(
                        "${challengeState.wrongAnswer}/3",
                        style: AppTypography.mediumBold(),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.w),
                child: Container(color: AppColors.black1, height: 1.w),
              ),
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24.h,
                  children: [
                    SizedBox(),
                    Text(
                      challengeState.currentQuestion!.question,
                      style: AppTypography.normal(color: AppColors.primaryText),
                      textAlign: TextAlign.justify,
                    ),
                    code.trim().isNotEmpty
                        ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundTransparent,
                            border: Border.all(
                              color: AppColors.primaryText,
                              width: 1.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: CodeText('''
$code'''),
                          ),
                        )
                        : SizedBox.shrink(),

                    Column(
                      spacing: 16.h,
                      children:
                          challengeState.currentQuestion!.choices
                              .map((option) => buildOption(option))
                              .toList(),
                    ),
                  ],
                ),
              ),
            ),

            bottomNavigationBar: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                border: Border(
                  top: BorderSide(color: AppColors.black1, width: 1.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomButton(
                  label: "Kirim",
                  onPressed:
                      () => {
                        ref
                            .read(soundEffectServiceProvider.notifier)
                            .playSubmit(),
                        _checkAnswer(context, ref, selectedAnswer!),
                      },
                  color: ButtonColor.purple,
                  isDisabled: selectedAnswer == null,
                ),
              ),
            ),
          ),
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            final isPopupVisible = ref.read(popupVisibilityProvider);
            if (isPopupVisible) {
              closePopupOverlay(ref);
            } else {
              showPopupOverlay(
                context,
                MenuPopup(
                  onRestart: () {
                    challengeController.resetChallenge();
                    closePopupOverlay(ref);
                  },
                  onExit: () {
                    challengeController.endChallengePopup();
                    closePopupOverlay(ref);
                  },
                  onClose: () {
                    closePopupOverlay(ref);
                  },
                  onGoBack: () {
                    closePopupOverlay(ref);
                  },
                ),
                ref,
              );
            }
          },
        );
      },
    );
  }

  Widget buildOption(ChoicesModel option) {
    final bool isSelected = selectedAnswer == option;

    return GestureDetector(
      onTap: () {
        soundEffectService.playButtonClick2();
        selectAnswer(option);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.skyByte : Colors.transparent,
            width: 2.w,
          ),
          color:
              isSelected ? AppColors.selectedBlue : AppColors.blueTransparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          option.text,
          style: AppTypography.normal(color: AppColors.primaryText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _checkAnswer(
    BuildContext context,
    WidgetRef ref,
    ChoicesModel selected,
  ) {
    // Buat Nyimpan String Jawaban Benar

    // final choices =
    //     ref.read(challengeControllerProvider).value!.currentQuestion!.choices;
    // final correctAnswer = choices.firstWhere((c) => c.isCorrect == true).text;

    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          soundEffectService.playPopupAnswer();
          ref.read(challengeControllerProvider.notifier).checkAnswer(selected);
          closePopupOverlay(ref);
          clearSelection();
        },
      ),
      ref,
    );
  }
}
