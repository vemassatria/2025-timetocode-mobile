import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
//import 'package:timetocode/games/backend/controllers/challenge_controller.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data statis 
    final levelData = [
      {'levelNumber': 1, 'starCount': 1, 'isUnlocked': true},
      {'levelNumber': 2, 'starCount': 2, 'isUnlocked': true},
      {'levelNumber': 3, 'starCount': 3, 'isUnlocked': true},
      {'levelNumber': 4, 'starCount': 0, 'isUnlocked': true},
      {'levelNumber': 5, 'starCount': 0, 'isUnlocked': false},
      {'levelNumber': 6, 'starCount': 0, 'isUnlocked': false},
    ];
    
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        title: Text(
          'Tantangan Konsep Pemrograman',
          style: AppTypography.heading6(color: AppColors.white),
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
            childAspectRatio: 1.0, 
          ),
          itemCount: levelData.length,
          itemBuilder: (context, index) {
            final level = levelData[index];
            
            return ChallengeCard(
              levelNumber: level['levelNumber'] as int,
              starCount: level['starCount'] as int,
              isUnlocked: level['isUnlocked'] as bool,
              onTap: level['isUnlocked'] as bool
                  ? () {
                      _navigateToChallenge(context, level['levelNumber'] as int);
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
      builder: (context) => AlertDialog(
        title: Text(
          'Level $levelNumber',
          style: AppTypography.heading5(color: AppColors.primaryText),
        ),
        content: Text(
          'Halaman detail untuk Level $levelNumber akan ditampilkan di sini.',
          style: AppTypography.normal(color: AppColors.primaryText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Tutup',
              style: AppTypography.normalBold(color: AppColors.primaryText),
            ),
          ),
        ],
      ),
    );
  }
}
