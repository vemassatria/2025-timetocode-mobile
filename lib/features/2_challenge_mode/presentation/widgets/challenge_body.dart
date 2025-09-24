import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/answer_choices.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/question_content.dart';

class ChallengeBody extends ConsumerWidget {
  final ChoicesModel? selectedAnswer;
  final ValueChanged<ChoicesModel> onAnswerSelected;

  const ChallengeBody({super.key, 
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(
      challengeControllerProvider.select((state) => state.currentQuestion),
    );

    if (question == null) {
      // Menangani kasus di mana pertanyaan belum dimuat
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          QuestionContent(text: question.text, code: question.code),
          SizedBox(height: 24.h),
          AnswerChoices(
            choices: question.choices,
            selectedAnswer: selectedAnswer,
            onAnswerSelected: onAnswerSelected,
          ),
        ],
      ),
    );
  }
}
