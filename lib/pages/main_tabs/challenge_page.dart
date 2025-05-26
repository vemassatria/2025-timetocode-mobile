import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_challenge_provider.dart';
import 'package:timetocode/pages/main_tabs/quiz_page.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
//import 'package:timetocode/games/backend/controllers/challenge_controller.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelCompleted = ref.watch(completedChallengeProvider);
    final notifier = ref.read(completedChallengeProvider.notifier);
    final storyState = ref.watch(challengeControllerProvider).value!;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        title: Text(
          storyState.challenge.title,
          style: AppTypography.heading6(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 24.w,
            childAspectRatio: 1,
          ),
          itemCount: storyState.challenge.levels.length,
          itemBuilder: (context, index) {
            final level = storyState.challenge.levels[index];
            final levelNumber = level.id;
            final isUnlocked = levelCompleted <= levelNumber + 1;

            return ChallengeCard(
              levelNumber: levelNumber,
              starCount: notifier.getCompletedChallengeStars(levelNumber),
              isUnlocked: isUnlocked,
              onTap:
                  isUnlocked
                      ? () {
                        // Navigasi ke halaman challenge detail ketika card diklik
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => QuizPage(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  correctAnswer: 1,
                                  wrongAnswer: 2,
                                  question:
                                      "Yang manakah output yang benar dari kode di bawah ini?",
                                  code:
                                      "#include <stdio.h>\n\nint main() {\n  int age = 25;\n\n  printf(\"Age: %d\\n\", age);\n\n  return 0;\n}",
                                  options: [
                                    "Age: %d\\n",
                                    "Age: 25",
                                    "Age: %d",
                                    "Age: 25\\n",
                                  ],
                                ),
                          ),
                        );
                      }
                      : null,
            );
          },
        ),
      ),
    );
  }

  //   void _navigateToChallenge(BuildContext context, int levelNumber) {
  //     // Untuk sementara, tampilkan dialog sebagai placeholder
  //     showDialog(
  //       context: context,
  //       builder:
  //           (context) => AlertDialog(
  //             title: Text(
  //               'Level $levelNumber',
  //               style: AppTypography.heading5(color: AppColors.primaryText),
  //             ),
  //             content: Text(
  //               'Halaman detail untuk Level $levelNumber akan ditampilkan di sini.',
  //               style: AppTypography.normal(color: AppColors.primaryText),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: Text(
  //                   'Tutup',
  //                   style: AppTypography.normalBold(color: AppColors.primaryText),
  //                 ),
  //               ),
  //             ],
  //           ),
  //     );
  //   }
}
