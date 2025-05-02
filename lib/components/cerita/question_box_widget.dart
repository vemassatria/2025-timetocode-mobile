import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/code_box.dart';
import 'package:timetocode/components/box/question_box.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/games/models/choices_model.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/components/box/choices_box.dart';

class QuestionBoxWidget extends StatefulWidget {
  final GameEngine game;
  const QuestionBoxWidget({super.key, required this.game});

  @override
  State<QuestionBoxWidget> createState() => _QuestionBoxWidgetState();
}

class _QuestionBoxWidgetState extends State<QuestionBoxWidget> {
  late String questionText;
  late String codeText;
  late List<ChoicesModel> options;

  @override
  void initState() {
    options = widget.game.currentQuestion.choices;
    questionText = widget.game.currentQuestion.question;
    codeText = widget.game.currentQuestion.code;
    super.initState();
  }

  void checkAnswer(ChoicesModel selected) {
    if (selected.isCorrect!) {
      widget.game.correctAnswer++;
    } else {
      widget.game.wrongAnswer++;
    }

    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          if (selected.nextType == 'dialog') {
            widget.game.setCurrentDialog(selected.next!);
            widget.game.removeQuestion();
          } else if (selected.nextType == 'soal') {
            widget.game.setCurrentQuestion(selected.next!);
            widget.game.removeQuestion();
          } else {
            widget.game.overlays.add('EndGame');
          }

          closePopupOverlay();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/background/lab.webp', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (codeText.trim().isNotEmpty) ...[
                    QuestionBox(questionText: questionText),
                    SizedBox(height: 16.h),
                    CodeBox(code: codeText),
                  ] else ...[
                    Expanded(
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
              onPressed: (index) {
                checkAnswer(options[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
