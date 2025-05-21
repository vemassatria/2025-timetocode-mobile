import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/themes/colors.dart';
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
      {'levelNumber': 4, 'starCount': 0, 'isUnlocked': false},
      {'levelNumber': 5, 'starCount': 0, 'isUnlocked': false},
      {'levelNumber': 6, 'starCount': 0, 'isUnlocked': false},
    ];
    
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tantangan Konsep Pemrograman',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
          itemCount: levelData.length,
          itemBuilder: (context, index) {
            final level = levelData[index];
            
            return ChallengeCard(
              levelNumber: level['levelNumber'] as int,
              starCount: level['starCount'] as int,
              isUnlocked: level['isUnlocked'] as bool,
              onTap: level['isUnlocked'] as bool
                  ? () {
                      // Navigasi ke halaman challenge detail ketika card diklik
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
        title: Text('Level $levelNumber'),
        content: Text('Halaman detail untuk Level $levelNumber akan ditampilkan di sini.'),
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