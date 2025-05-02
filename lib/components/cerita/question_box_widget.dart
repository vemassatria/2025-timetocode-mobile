import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/games/models/choices_model.dart';
import 'package:timetocode/widgets/code_text.dart';
import 'package:timetocode/components/button.dart';

class QuestionBoxWidget extends StatefulWidget {
  final GameEngine game;
  const QuestionBoxWidget({super.key, required this.game});

  @override
  State<QuestionBoxWidget> createState() => _QuestionBoxWidgetState();
}

class _QuestionBoxWidgetState extends State<QuestionBoxWidget> {
  late String questionText;
  late List<ChoicesModel> options;

  @override
  void initState() {
    options = widget.game.currentQuestion!.choices;
    questionText = widget.game.currentQuestion!.question;
    super.initState();
  }

  void checkAnswer(ChoicesModel selected) {
    if (selected.isCorrect!) {
      widget.game.correctAnswer++;
    } else {
      widget.game.wrongAnswer++;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(selected.isCorrect! ? 'Benar!' : 'Salah!'),
            content: Text(
              selected.isCorrect!
                  ? 'Jawaban kamu benar!'
                  : 'Jawaban salah, coba lagi.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );

    if (selected.nextType == 'dialog') {
      widget.game.setCurrentDialog(selected.next!);
      widget.game.removeQuestion();
    } else if (selected.nextType == 'soal') {
      widget.game.removeQuestion();
      widget.game.setCurrentQuestion(selected.next!);
    } else {
      widget.game.removeQuestion();
      widget.game.overlays.remove('QuestionBox');
      widget.game.overlays.remove('StoryMenu');
      widget.game.overlays.add('EndGame');
    }
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
                  // Kotak "kode"
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF161B22,
                      ).withOpacity(0.8), // Semi-transparent background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CodeText('''
                    $questionText
                    '''),
                  ),
                  const SizedBox(height: 24),
                  // Pilihan jawaban
                  ...options.map(
                    (option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),

                      child: CustomButton(
                        onPressed: () => checkAnswer(option),
                        type: ButtonType.outline,
                        color: ButtonColor.blue,
                        label: option.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
