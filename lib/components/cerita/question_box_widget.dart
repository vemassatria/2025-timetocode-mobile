import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/code_box.dart';
import 'package:timetocode/components/box/question_box.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/components/box/choices_box.dart';

// Add import for StoryController provider
import 'package:timetocode/games/backend/providers/story_provider.dart';

class QuestionBoxWidget extends ConsumerWidget {
  const QuestionBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch StoryController state
    final storyStateAsync = ref.watch(storyControllerProvider);

    // Return loading indicator if state is loading
    return storyStateAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (storyState) {
        final questionData = storyState.currentQuestion!;
        final questionText = questionData.question;
        final codeText = questionData.code;
        final options = questionData.choices;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 76.h, 16.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (codeText.trim().isNotEmpty) ...[
                        QuestionBox(questionText: questionText, height: 100.h),
                        SizedBox(height: 16.h),
                        CodeBox(code: codeText),
                      ] else ...[
                        Container(
                          height: 374.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
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
                  onPressed:
                      (index) => _checkAnswer(context, ref, options[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkAnswer(
    BuildContext context,
    WidgetRef ref,
    ChoicesModel selected,
  ) {
    final storyController = ref.read(storyControllerProvider.notifier);

    // Show popup with answer result
    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          // Use StoryController to handle answer and progression
          storyController.checkAnswer(selected);
          closePopupOverlay();
        },
      ),
    );
  }
}
