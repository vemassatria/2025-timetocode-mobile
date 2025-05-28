import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/widgets/code_text.dart';

class QuizPage extends StatefulWidget {
  final VoidCallback onPressed;
  final int correctAnswer;
  final int wrongAnswer;
  final String question;
  final String code;
  final List<String> options;

  const QuizPage({
    super.key,
    required this.onPressed,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.question,
    required this.code,
    required this.options,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedAnswer;

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  Widget buildOption(String optionText) {
    final bool isSelected = selectedAnswer == optionText;

    return GestureDetector(
      onTap: () => selectAnswer(optionText),
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
          optionText,
          style: AppTypography.normal(color: AppColors.primaryText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  "${widget.correctAnswer}/3",
                  style: AppTypography.mediumBold(),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(width: 16.w),
              Icon(Icons.cancel, color: AppColors.dangerRed),
              SizedBox(
                width: 30.w,
                child: Text(
                  "${widget.wrongAnswer}/3",
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
                widget.question,
                style: AppTypography.normal(color: AppColors.primaryText),
                textAlign: TextAlign.justify,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundTransparent,
                  border: Border.all(color: AppColors.primaryText, width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: CodeText('''
${widget.code}'''),
                ),
              ),

              Column(
                spacing: 16.h,
                children:
                    widget.options
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
            onPressed: widget.onPressed,
            color: ButtonColor.purple,
            isDisabled: selectedAnswer == null,
          ),
        ),
      ),
    );
  }
}
