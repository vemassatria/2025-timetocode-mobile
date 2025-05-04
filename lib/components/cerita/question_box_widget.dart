import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/code_box.dart';
import 'package:timetocode/components/box/question_box.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/games/models/choices_model.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/components/box/choices_box.dart';

class QuestionBoxWidget extends ConsumerStatefulWidget {
  const QuestionBoxWidget({super.key});

  @override
  ConsumerState<QuestionBoxWidget> createState() => _QuestionBoxWidgetState();
}

class _QuestionBoxWidgetState extends ConsumerState<QuestionBoxWidget> {
  late String questionText;
  late String codeText;
  late List<ChoicesModel> options;
  late GameEngine game;

  @override
  void initState() {
    game = ref.read(gameEngineProvider);
    options = game.currentQuestion!.choices;
    questionText = game.currentQuestion!.question;
    codeText = game.currentQuestion!.code;
    super.initState();
  }

  void checkAnswer(ChoicesModel selected) {
    if (selected.isCorrect!) {
      game.correctAnswer++;
    } else {
      game.wrongAnswer++;
    }

    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          if (selected.nextType == 'dialog') {
            game.setCurrentDialog(selected.next!);
            game.removeQuestion();
          } else if (selected.nextType == 'soal') {
            game.setCurrentQuestion(selected.next!);
            game.removeQuestion();
          } else {
            game.overlays.add('EndGame');
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

          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: MenuButton(
                  onRestart: () {
                    if (game.activeMode == "intro") {
                      game.removeIntro();
                    } else if (game.activeMode == "dialog") {
                      game.removeDialog();
                    } else {
                      game.removeQuestion();
                    }
                    game.startLevel(game.activeLevel);
                    closePopupOverlay();
                  },
                  onExit: () {
                    if (game.activeMode == "intro") {
                      game.removeIntro();
                    } else if (game.activeMode == "dialog") {
                      game.removeDialog();
                    } else {
                      game.removeQuestion();
                    }
                    game.endGame();
                    game.overlays.remove('StoryMenu');
                    closePopupOverlay();
                  },
                ),
              ),
            ),
          ),

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
                      decoration: BoxDecoration(color: Colors.transparent),
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
