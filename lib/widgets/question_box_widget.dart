import 'package:flutter/material.dart';

class QuestionBoxWidget extends StatefulWidget {
  const QuestionBoxWidget({
    super.key,
    required Null Function() onCorrect,
    required Null Function() onWrong,
  });

  @override
  State<QuestionBoxWidget> createState() => _QuestionBoxWidgetState();
}

class _QuestionBoxWidgetState extends State<QuestionBoxWidget> {
  final List<String> options = ['8', '6', '10', '9'];
  final String correctAnswer = '8';

  void checkAnswer(String selected) {
    final isCorrect = selected == correctAnswer;

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
      backgroundColor: const Color(0xFF0D1117), // Dark background
      appBar: AppBar(
        title: const Text('Quiz Code'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kotak "kode"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '''
int add(int a, int b) {
  return a + b;
}

void main() {
  int result = add(3, 5); // INI COMMENTNYA PANJANG BIAR MELEBIHI BATAS
  print(result); // Output: 8
}
''',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'FiraCode',
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Pilihan jawaban
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => checkAnswer(option),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
