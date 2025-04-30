import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';
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
  late List<String> options;
  late String correctAnswer;

  @override
  void initState() {
    options = widget.game.currentQuestion.getChoices();
    questionText = widget.game.currentQuestion.question;
    correctAnswer = widget.game.currentQuestion.getCorrectAnswer();
    super.initState();
  }

  void checkAnswer(String selected) {
    final isCorrect = selected == correctAnswer;

    if (isCorrect) {
      widget.game.correctAnswer++;
    } else {
      widget.game.wrongAnswer++;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(isCorrect ? 'Benar!' : 'Salah!'),
            content: Text(
              isCorrect ? 'Jawaban kamu benar!' : 'Jawaban salah, coba lagi.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
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
                        label: option,
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
