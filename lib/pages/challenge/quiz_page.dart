import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/widgets/code_text.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: AppColors.xpGreen),
              SizedBox(
                width: 30.w,
                child: Text(
                  "${challenge.correctAnswer}/3",
                  style: AppTypography.mediumBold(),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(width: 16.w),
              Icon(Icons.cancel, color: AppColors.dangerRed),
              SizedBox(
                width: 30.w,
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
          border: Border(top: BorderSide(color: AppColors.black1, width: 1.w)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: CustomButton(
            label: "Kirim",
            onPressed:
                () => {
                  ref
                      .read(challengeControllerProvider.notifier)
                      .checkAnswer(selectedAnswer!),
                  clearSelection(),
                },
            color: ButtonColor.purple,
            isDisabled: selectedAnswer == null,
          ),
        ),
      ),
    );
  }
}
