import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_challenge_provider.dart';
import 'package:timetocode/themes/colors.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tantangan Konsep Pemrograman',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0, // Card berbentuk persegi
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
                        _navigateToChallenge(context, levelNumber);
                      }
                      : null,
            );
          },
        ),
      ),
    );
  }

  void _navigateToChallenge(BuildContext context, int levelNumber) {
    // Untuk sementara, tampilkan dialog sebagai placeholder
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Level $levelNumber'),
            content: Text(
              'Halaman detail untuk Level $levelNumber akan ditampilkan di sini.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tutup'),
              ),
            ],
          ),
    );
  }
}
