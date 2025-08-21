import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/0_core/widgets/question_box.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/answer_popup.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/choices_box.dart';

class QuestionBoxWidget extends ConsumerWidget {
  const QuestionBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(
      storyControllerProvider.select((state) => state.currentQuestion),
    );
    final questionText = question!.text;
    final codeText = question.code;
    final options = question.choices;

    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 76.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (codeText != null) ...[
                  QuestionBox(questionText: questionText, height: 120.h),
                  SizedBox(height: 16.h),
                  CodeBox(code: codeText),
                ] else ...[
                  Container(
                    height: 374.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: QuestionBox(questionText: questionText),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ChoicesBox(
            choices: options,
            onPressed: (index) => _checkAnswer(context, ref, options[index]),
          ),
        ),
      ],
    );
  }

  void _checkAnswer(
    BuildContext context,
    WidgetRef ref,
    ChoicesModel selected,
  ) {
    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          ref.read(storyControllerProvider.notifier).checkAnswer(selected);
          closePopupOverlay(ref);
        },
      ),
      ref,
    );
  }
}
