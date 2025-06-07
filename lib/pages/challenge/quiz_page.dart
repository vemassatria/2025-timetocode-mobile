import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/widgets/code_text.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  ChoicesModel? selectedAnswer;

  void selectAnswer(ChoicesModel answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void clearSelection() {
    setState(() {
      selectedAnswer = null;
    });
  }

  Widget buildOption(ChoicesModel option) {
    final bool isSelected = selectedAnswer == option;

    return GestureDetector(
      onTap: () => selectAnswer(option),
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

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(challengeControllerProvider);
    final challenge = asyncState.value;
    final code = challenge!.currentQuestion!.code;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (PopscopePopups.isPopScopeActive()) {
          PopscopePopups.openMenuPopupChallange(context, ref);
          PopscopePopups.setPopScope(false);
        } else {
          closePopupOverlay();
          PopscopePopups.setPopScope(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.surfaceDark,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: AppColors.primaryText),
            onPressed:
                () => PopscopePopups.openMenuPopupChallange(context, ref),
          ),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: AppColors.xpGreen),
                SizedBox(
                  width: 35.w,
                  child: Text(
                    "${challenge.correctAnswer}/3",
                    style: AppTypography.mediumBold(),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(width: 16.w),
                Icon(Icons.cancel, color: AppColors.dangerRed),
                SizedBox(
                  width: 35.w,
                  child: Text(
                    "${challenge.wrongAnswer}/3",
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
                  challenge.currentQuestion!.question,
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
                      challenge.currentQuestion!.choices
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
              onPressed: () => {_checkAnswer(context, ref, selectedAnswer!)},
              color: ButtonColor.purple,
              isDisabled: selectedAnswer == null,
            ),
          ),
        ),
      ),
    );
  }

  void _checkAnswer(
    BuildContext context,
    WidgetRef ref,
    ChoicesModel selected,
  ) {
    final challengeController = ref.read(challengeControllerProvider.notifier);

    // Buat Nyimpan String Jawaban Benar

    // final choices =
    //     ref.read(challengeControllerProvider).value!.currentQuestion!.choices;
    // final correctAnswer = choices.firstWhere((c) => c.isCorrect == true).text;

    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          challengeController.checkAnswer(selected);
          closePopupOverlay();
          clearSelection();
        },
      ),
    );
  }
}
